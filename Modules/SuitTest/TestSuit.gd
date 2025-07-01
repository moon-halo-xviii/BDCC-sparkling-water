extends ItemBase

func _init():
	id = "TestSuit"

func getVisibleName():
	return "TestSuit"

func getDescription():
	return "Hot suit, cosmetic test, WIP"

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
	]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your suit"
	else:
		return "take off your suit"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your suit"
	else:
		return "put on your suit"

func generateItemState():
	itemState = ShirtAndShortsState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"clothing": "res://Modules/SuitTest/TestSuit/TestSuit.tscn"
	}

