extends ItemBase

func _init():
	id = "BDMSP_JumpsuitRed"

func getVisibleName():
	return "BDMSP High-Security Prisoner Jumpsuit"
	
func getDescription():
	return "Prisoner jumpsuit for very dangerous people"

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your jumpsuit"
	else:
		return "take off your jumpsuit"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts your jumpsuit on"
	else:
		return "put your jumpsuit on"

func generateItemState():
	itemState = ShirtAndShortsState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"clothing": "res://Modules/BDCCDD_ASSETS/Items/Clothes/BDMSP_JumpsuitRed/BDMSP_Jumpsuit.tscn",
	}

func getHidesParts(_character):
	if(itemState.isRemoved()):
		return null
	var removed = {
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

#func updateDoll(doll: Doll3D):
#	doll.setState("armalpha", "hidearms")
