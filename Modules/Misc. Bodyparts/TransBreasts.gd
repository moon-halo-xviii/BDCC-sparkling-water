extends BodypartBreasts

func _init():
	visibleName = "Flat Chest (Trans Scar)"
	id = "transbreasts"
	size = BreastsSize.FOREVER_FLAT

# {FOREVER_FLAT = -1, FLAT = 0, A = 1, B = 2, C = 3, D = 4, DD = 5, E = 6, EE = 7, F = 8, FF = 9, G = 10, GG = 11}

func getCompatibleSpecies():
	return [Species.Any]

func getBreastsScale():
	var thesize = getSize()
	return BreastsSize.breastSizeToBoneScale(thesize)

func getDoll3DScene():
	var thesize = getSize()
	if(thesize <= BreastsSize.FLAT):
		return "res://Modules/Misc. Bodyparts/Bodyparts/TransBreasts/TransFlat.tscn"
	return "res://Modules/Misc. Bodyparts/Bodyparts/TransBreasts/TransFlat.tscn"

func safeWhenExposed():
	if(size <= BreastsSize.A):
		return true

func generateDataFor(_dynamicCharacter):
	size = BreastsSize.FOREVER_FLAT

func getCharacterCreatorDesc():
	return "Npcs wont generate with this sadly"

#func npcGenerationWeight(_dynamicCharacter):
#	return 3.0
