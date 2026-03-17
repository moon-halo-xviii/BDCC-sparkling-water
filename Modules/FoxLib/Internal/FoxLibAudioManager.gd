extends GameExtender

const Globals = preload("res://FoxLib/Globals.gd")
const FoxUIManager = preload("res://FoxLib/FoxUIManager.gd")

class FLAMStatics:
	var foxAudios = {}
	var possible_values = [""]
	var volume_db = 0.0
	var sfxPlayer = null
	var bgmPlayer = null
	var bgm = null
	
	func onBgmFinished():
		if self.bgm == null or self.bgmPlayer == null:
			return
		var nextAudioSample = self.bgm.getLoadedAudio()
		if nextAudioSample != null:
			self.bgmPlayer.set_stream(nextAudioSample)
			self.bgmPlayer.play()

func _init():
	id = "FoxLibAudioManager"

func register(_GES:GameExtenderSystem):
	_GES.register(self, ExtendGame.saveLoadData)

func saveData():
	var data = {}
	var flam = Globals.of(FLAMStatics)
	if flam.bgm != null:
		data["bgm"] = flam.bgm.id
	else:
		data["bgm"] = ""
	return data

func loadData(_data):
	if _data == null:
		playBGM(null)
	else:
		playBGM(getFoxAudio(SAVE.loadVar(_data, "bgm", "")))

static func isValidAudioPath(path):
	if not path.begins_with("res://"):
		return false
	if path.ends_with(".wav"):
		return true
	if path.ends_with(".ogg"):
		return true
	if path.ends_with(".mp3"):
		return true
	return false

static func loadAsAudioStream(path):
	if not path.begins_with("res://"):
		return null
	if ResourceLoader.exists(path):
		var audio = ResourceLoader.load(path)
		if path.ends_with(".ogg") or path.ends_with(".mp3"):
			audio.loop = false
		return audio
	if path.ends_with(".ogg") or path.ends_with(".mp3"):
		var file = File.new()
		if file.open(path, File.READ) != OK:
			Log.error("[FoxLib] Failed to open .ogg file: " + path)
			return null
		if file.get_len() <= 0:
			file.close()
			Log.error("[FoxLib] Failed to open .ogg file: " + path)
			return null
		var data: PoolByteArray = file.get_buffer(file.get_len())
		file.close()
		var stream = null
		if path.ends_with(".mp3"):
			stream = AudioStreamMP3.new()
		else:
			stream = AudioStreamOGGVorbis.new()
		stream.data = data
		stream.loop = false
		stream.loop_offset = 0.0
		if stream.get_length() <= 0.0:
			Log.error("[FoxLib] Invalid audio data: " + path)
			return null
		return stream
	return null

static func registerFoxAudio(foxAudio):
	if foxAudio == null:
		return
	var id = foxAudio.getId()
	if id == null or id == "":
		return
	var flam = Globals.of(FLAMStatics)
	flam.foxAudios[id] = foxAudio
	flam.possible_values.append(id)

static func installOnScene():
	var flam = Globals.of(FLAMStatics)
	# De-initialize
	FoxUIManager.deParent(flam.sfxPlayer)
	FoxUIManager.deParent(flam.bgmPlayer)
	flam.sfxPlayer = null
	flam.bgmPlayer = null
	flam.bgm = null
	# Initialize
	var currentScene = FoxUIManager.getCurrentScene()
	var sfxPlayer = AudioStreamPlayer.new()
	var bgmPlayer = AudioStreamPlayer.new()
	sfxPlayer.volume_db = flam.volume_db
	bgmPlayer.volume_db = flam.volume_db
	currentScene.add_child(sfxPlayer)
	currentScene.add_child(bgmPlayer)
	flam.sfxPlayer = sfxPlayer
	flam.bgmPlayer = bgmPlayer
	bgmPlayer.connect("finished", flam, "onBgmFinished")

static func playSFX(foxAudio):
	var pitchDiff = 0.0
	var pitchVariance = foxAudio.pitchVariance
	if pitchVariance > 0.5:
		pitchDiff = rand_range(-0.5, 0.5)
	elif pitchVariance > 0.0:
		pitchDiff = rand_range(-pitchVariance, pitchVariance)
	playAudioSampleAsSFX(foxAudio.getLoadedAudio(), pitchDiff)

static func playAudioSampleAsSFX(audioSample, pitchDiff=0.0):
	if audioSample != null and ((audioSample is AudioStreamOGGVorbis) or (audioSample is AudioStreamMP3)) and audioSample.loop:
		# Disable looping for incomming audio samples as we do not support looping audio properly.
		audioSample.loop = false
	if pitchDiff < -0.5:
		pitchDiff = -0.5
	elif pitchDiff > 0.5:
		pitchDiff = 0.5
	var flam = Globals.of(FLAMStatics)
	if flam.sfxPlayer == null:
		return
	if flam.sfxPlayer.is_playing():
		flam.sfxPlayer.stop()
	if audioSample != null:
		flam.sfxPlayer.pitch_scale = 1.0 + pitchDiff
		flam.sfxPlayer.set_stream(audioSample)
		flam.sfxPlayer.play()
	else:
		flam.sfxPlayer.pitch_scale = 1.0

static func playNamedSFX(foxSoundId):
	if foxSoundId == null or foxSoundId == "":
		return
	var flam = Globals.of(FLAMStatics)
	var foxAudio = flam.foxAudios.get(foxSoundId)
	if foxAudio != null:
		playSFX(foxAudio)

static func playBGM(foxSound):
	var flam = Globals.of(FLAMStatics)
	if flam.bgmPlayer == null:
		return
	if flam.bgm == foxSound and flam.bgmPlayer.is_playing():
		# Skip switching or resetting track if the same audio is being used
		return
	flam.bgm = foxSound
	# Stop call will call the looping code which will play the current sample
	if flam.bgmPlayer.is_playing():
		flam.bgmPlayer.stop()
	elif foxSound != null:
		var nextAudioSample = foxSound.getLoadedAudio()
		if nextAudioSample != null:
			flam.bgmPlayer.set_stream(nextAudioSample)
			flam.bgmPlayer.play()

static func playNamedBGM(foxSoundId):
	if foxSoundId == null or foxSoundId == "":
		playBGM(null)
		return
	var flam = Globals.of(FLAMStatics)
	var foxAudio = flam.foxAudios.get(foxSoundId)
	if foxAudio != null:
		playBGM(foxAudio)

static func getBGMId():
	var flam = Globals.of(FLAMStatics)
	if flam.bgm == null:
		return ""
	return flam.bgm.getId()

static func setVolume(audioVolume):
	var volume_db = 0.0
	if audioVolume <= 0.001:
		volume_db = -80.0
	else:
		volume_db = log(audioVolume / 100.0) * 8.6858896380650365530225783783321
	var flam = Globals.of(FLAMStatics)
	flam.volume_db = volume_db
	if flam.sfxPlayer != null:
		flam.sfxPlayer.volume_db = volume_db
	if flam.bgmPlayer != null:
		flam.bgmPlayer.volume_db = volume_db

static func getAllAudioIDs():
	return Globals.of(FLAMStatics).possible_values

static func getCurrentBGM():
	return Globals.of(FLAMStatics).bgm

static func getFoxAudio(foxAudioId):
	if foxAudioId == null or foxAudioId == "":
		return null
	return Globals.of(FLAMStatics).foxAudios.get(foxAudioId)
