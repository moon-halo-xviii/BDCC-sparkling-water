extends ItemBase

func _init():
	id = "OfficialTrenchcoat"

func getVisibleName():
	return "Official Trenchcoat"
	
func getDescription():
	return "Long clothes for long people."

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
		]

func getTags():
	return [
		#ItemTag.Illegal,
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your coat and pulls down the pants"
	else:
		return "take off your coat and pulls down the pants"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your coat and pants"
	else:
		return "put on your coat and pants"

func generateItemState():
	itemState = ShirtAndShortsState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"clothing": "res://Modules/BDCCDD_ASSETS/Items/Clothes/OfficialTrenchcoat/OfficialTrenchcoat.tscn",
	}

func getHidesParts(_character):
	if(itemState.isRemoved()):
		return null
	var removed = {
		#BodypartSlot.Body: true,
		BodypartSlot.Legs: true,
		BodypartSlot.Arms: true,
		BodypartSlot.Breasts: true,
		"panties": true,
		"bra": true,
		"top": true,
	}
	if(!itemState.areShortsPulledDown() && !itemState.isDamaged()):
		removed[BodypartSlot.Penis] = true
	
	return removed
