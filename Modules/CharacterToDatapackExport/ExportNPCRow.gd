extends PanelContainer

onready var _npcNameLabel = $HBoxContainer/Name
onready var _npcGenderLabel = $HBoxContainer/Gender
onready var _npcSpeciesLabel = $HBoxContainer/Species
onready var meetButton = $HBoxContainer/CenterContainer2/Meet
onready var showNpcButton = $ShowNPC
signal selectNPC(npcID)
var _npcID setget setNpcID, getNpcID
var _npcOccupation: String
var affection:float = 0.0
var lust:float = 0.0

func initData(name, gender, species, ID, occupation, canMeet=true):
	_npcNameLabel.text = name
	_npcGenderLabel.text  = gender
	_npcSpeciesLabel.text = species
	self._npcID = ID
	_npcOccupation = occupation
	meetButton.disabled = !canMeet

func setNpcID(ID: String):
	if(ID == ""):
		Log.error("Exception: attempt to set an empty character ID")
	else:
		_npcID = ID


func getNpcID():
	if(_npcID != null):
		return _npcID
	else: 
		Log.error("Exception: ExportNPCRow: character ID was not set")


func getNpcName():
	return _npcNameLabel.text


func getNpcGender():
	return _npcGenderLabel.text

func getSpeciesFullName():
	return _npcSpeciesLabel.text

func _on_ShowNPC_pressed():
	GM.ui.clearCharactersPanel()
	GM.main.playAnimation(StageScene.Duo, "stand", {npc=_npcID})
	
	var character = GlobalRegistry.getCharacter(_npcID)
	GM.ui.getCharactersPanel().addCharacter(_npcID)
	character.addEffect(StatusEffect.SexEngineLikes)
	character.addEffect(StatusEffect.SexEnginePersonality)
	GM.ui.updateCharactersInPanel()


func _on_Meet_pressed():
	emit_signal("selectNPC", _npcID)
