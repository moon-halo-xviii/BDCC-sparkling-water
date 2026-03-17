extends Module

var ddAudio = {}

func _init():
	id = "BDCCDD-SOUNDTEST"
	author = "MOON_HALO"


func onFoxLibModInit(foxModuleAPI):
	if foxModuleAPI.isFoxLibAtLeast(0,10,0):
		
		ddAudio["track0"] = foxModuleAPI.newAudio("Aja", "res://Modules/BDCCDD-SOUNDTEST/BGM/Aja.mp3")
		ddAudio["track1"] = foxModuleAPI.newAudio("EasyWayOut", "res://Modules/BDCCDD-SOUNDTEST/BGM/Easy Way Out.mp3")
		ddAudio["track2"] = foxModuleAPI.newAudio("Ipanema", "res://Modules/BDCCDD-SOUNDTEST/BGM/The Girl From Ipanema.mp3")
		ddAudio["track3"] = foxModuleAPI.newAudio("IfIWasYourGirlfriend", "res://Modules/BDCCDD-SOUNDTEST/BGM/If I Was Your Girlfriend.mp3")
		ddAudio["track4"] = foxModuleAPI.newAudio("Photograph", "res://Modules/BDCCDD-SOUNDTEST/BGM/Photograph.mp3")
		ddAudio["track5"] = foxModuleAPI.newAudio("PrinciplesOfLust", "res://Modules/BDCCDD-SOUNDTEST/BGM/Principles Of Lust - Sadeness _ Find Love _ Sadeness (Reprise).mp3")
		ddAudio["track6"] = foxModuleAPI.newAudio("UltraPolka", "res://Modules/BDCCDD-SOUNDTEST/BGM/Ultra Polka.ogg")


