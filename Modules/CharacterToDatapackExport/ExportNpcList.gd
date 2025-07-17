extends Control

onready var npcRow = load("res://Modules/CharacterToDatapackExport/ExportNPCRow.tscn")
onready var container = $PanelContainer/VBoxC/ScrollC/VboxC2
onready var nameButton = $PanelContainer/VBoxC/UpperPanel/HBoxContainer/Name
onready var genderButton = $PanelContainer/VBoxC/UpperPanel/HBoxContainer/Gender
onready var popupWindow = $CenterContainer/Notification
onready var popupWindowLabel = $CenterContainer/Notification/NotificationLabel
onready var popupOkButton = $CenterContainer/Notification/HBoxC/Ok
onready var popupCancelButton = $CenterContainer/Notification/HBoxC/Cancel

var _nameBtnState: bool = true
var _genderBtnState: bool = true
var _IDtoForget
var nodeToFree
signal exportNPC(action, ID)

func addRow(name: String, gender: String, ID: String, occupation: String, canMeet: bool = true):
	var newRow = npcRow.instance()
	container.add_child(newRow)
	newRow.initData(name, gender, ID, occupation, canMeet)
	newRow.connect("selectNPC", self, "onSelectNPC")

func _on_Cancel_pressed():
	resetNotificationWindow()


func onSelectNPC(ID):
	emit_signal("exportNPC", "exportNPC", [ID])


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


func _on_Gender_pressed():
	unpressAllButtons()
	genderButton.pressed = true
	
	var nodesSortedArr = container.get_children()
	
	if(_genderBtnState):
		nodesSortedArr.sort_custom(self, "sortGenderAscending")
	else:
		nodesSortedArr.sort_custom(self, "sortGenderDescending")
		
	for nodeNum in nodesSortedArr.size():
		container.move_child(nodesSortedArr[nodeNum], nodeNum)
	
	_genderBtnState = !_genderBtnState


func sortGenderAscending(a: Node, b: Node):
	return a.getNpcGender().naturalnocasecmp_to(b.getNpcGender()) < 0
	
	
func sortGenderDescending(a: Node, b: Node):
	return a.getNpcGender().naturalnocasecmp_to(b.getNpcGender()) > 0

func unpressAllButtons():
	nameButton.pressed = false
	genderButton.pressed = false
