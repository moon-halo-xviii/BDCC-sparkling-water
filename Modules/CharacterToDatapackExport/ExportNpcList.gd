extends Control

onready var npcRow = load("res://Modules/CharacterToDatapackExport/ExportNPCRow.tscn")
onready var container = $PanelContainer/VBoxC/ScrollC/VboxC2
onready var nameButton = $PanelContainer/VBoxC/UpperPanel/HBoxContainer/Name
onready var genderButton = $PanelContainer/VBoxC/UpperPanel/HBoxContainer/Gender
onready var speciesButton = $PanelContainer/VBoxC/UpperPanel/HBoxContainer/Species
onready var popupWindow = $CenterContainer/Notification
onready var popupWindowLabel = $CenterContainer/Notification/NotificationLabel
onready var popupOkButton = $CenterContainer/Notification/HBoxC/Ok
onready var popupCancelButton = $CenterContainer/Notification/HBoxC/Cancel

var _nameBtnState: bool = true
var _genderBtnState: bool = true
var genderIndex: Array = []
var speciesIndex: Array = []
var selSpec = null
var selGen = null
var _IDtoForget
var nodeToFree
signal onExportPressed(ID)


func addRow(name: String, gender: String, species: String, ID: String, occupation: String, canMeet: bool = true):
	var newRow = npcRow.instance()
	container.add_child(newRow)
	newRow.initData(name, gender, species, ID, occupation, canMeet)
	if(not(gender in genderIndex)):
		genderIndex.append(gender)
	if(not(species in speciesIndex)):
		speciesIndex.append(species)
	newRow.connect("selectNPC", self, "onSelectNPC")

func _on_Cancel_pressed():
	resetNotificationWindow()


func onSelectNPC(ID):
	emit_signal("onExportPressed", ID)


func sendPopupMessage(msgText: String = ""):
	popupOkButton.visible = true
	popupWindowLabel.text = msgText
	popupWindow.popup_centered_ratio(0.3)


func _on_Ok_pressed():
	resetNotificationWindow()


func resetNotificationWindow():
	popupOkButton.visible = false
	popupCancelButton.visible = false
	popupWindow.visible = false


func _on_Name_pressed():
	unpressAllButtons()
	nameButton.pressed = true
	
	var nodesSortedArr = container.get_children()
	
	if(_nameBtnState):
		nodesSortedArr.sort_custom(self, "sortNameAscending")
	else:
		nodesSortedArr.sort_custom(self, "sortNameDescending")
		
	for nodeNum in nodesSortedArr.size():
		container.move_child(nodesSortedArr[nodeNum], nodeNum)
	
	_nameBtnState = !_nameBtnState


func sortNameAscending(a: Node, b: Node):
	return a.getNpcName().naturalnocasecmp_to(b.getNpcName()) < 0

func sortNameDescending(a: Node, b: Node):
	return a.getNpcName().naturalnocasecmp_to(b.getNpcName()) > 0

func sortGenderSelect(a: Node, b: Node):
	return Util._levenshtein_distance(a.getNpcGender(), selGen) < Util._levenshtein_distance(b.getNpcGender(), selGen)

func sortSpeciesSelect(a: Node, b: Node):
	return Util._levenshtein_distance(a.getSpeciesFullName(), selSpec) < Util._levenshtein_distance(b.getSpeciesFullName(), selSpec)


func _on_Species_item_selected(index:int):
	unpressAllButtons()
	if index == 0:
		return
	selSpec = speciesButton.get_item_text(index)
	var nodesSortedArr = container.get_children()
	
	nodesSortedArr.sort_custom(self, "sortSpeciesSelect")

	for nodeNum in nodesSortedArr.size():
		container.move_child(nodesSortedArr[nodeNum], nodeNum)

func _on_Gender_item_selected(index:int):
	unpressAllButtons()
	if index == 0:
		return
	selGen = genderButton.get_item_text(index)
	var nodesSortedArr = container.get_children()

	nodesSortedArr.sort_custom(self, "sortGenderSelect")

	for nodeNum in nodesSortedArr.size():
		container.move_child(nodesSortedArr[nodeNum], nodeNum)

func unpressAllButtons():
	nameButton.pressed = false
	genderButton.pressed = false
	speciesButton.pressed = false
