extends Module

func _init():
	id = "MeMenuModule"
	author = "MOON_HALO"
	
	scenes = [
		"res://Modules/CharacterToDatapackExport/ExportMenu.gd",
	]
	events = [
		"res://Modules/CharacterToDatapackExport/ExportButton.gd",
	]
