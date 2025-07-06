extends ItemBase

func _init():
	id = "HeelsSuit"

func getVisibleName():
	return "Pinstripe suit with heels"

func getDescription():
	return "A dark suit with light pinstripes, wrapped with a lower harness.\nThe high heeled-boots are bigger on the inside, a rare instance of bluespace being used for fashion."

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
		"clothing": "res://Modules/HeelsSuitModule/HeelsSuit/HeelsSuit.tscn"
	}

func getHidesParts(_character):
	if(itemState.isRemoved()):
		return null
	var removed = {
		BodypartSlot.Breasts: true,
		BodypartSlot.Legs: true
		"panties": true,
		"bra": true,
		"top": true,
	}

	if(!itemState.areShortsPulledDown() && !itemState.isDamaged()):
		removed[BodypartSlot.Penis] = true
	
	return removed
