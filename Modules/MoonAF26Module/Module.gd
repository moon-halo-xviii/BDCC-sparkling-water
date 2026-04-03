extends Module

func getFlags():
	return{
		"startedKaitQuest": flag(FlagType.Bool),
		"fcKaitWasBeatenUp": flag(FlagType.Bool),
		"fcKaitWasRaped": flag(FlagType.Bool),
		"fcKaitLost": flag(FlagType.Bool),

		"kaitCellVisited": flag(FlagType.Bool),
		"kaitVisitedPlayerCell": flag(FlagType.Bool),
		"gotBriefed": flag(FlagType.Bool),

		"kaitFondness": flag(FlagType.Number),
		"fcGroperReaction": flag(FlagType.Text),
	}

func _init():
	id = "MoonAF26"
	author = "MOON_HALO"

	scenes = [
		"res://Modules/MoonAF26Module/KaitStartQuest_Lost.gd",
		"res://Modules/MoonAF26Module/KaitStartQuest_Won.gd",
		"res://Modules/MoonAF26Module/KaitCellScene.gd",
		"res://Modules/MoonAF26Module/PlayerCellSceneAF26.gd",
		"res://Modules/MoonAF26Module/KaitQuestBriefing.gd",
	]

	events = [
		"res://Modules/MoonAF26Module/PlayerCellEventAF26.gd",
		"res://Modules/MoonAF26Module/KaitCellEvent.gd",
	]

	characters = [
		"res://Modules/MoonAF26Module/MOONCharacter.gd",
	]