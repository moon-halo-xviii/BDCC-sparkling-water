extends ItemBase

func _init():
	id = "HeelsSuit"

func getVisibleName():
	return "Pinstripe suit with heels"

func getDescription():
	return "A dark suit with light pinstripes, wrapped with a lower harness.\n\nThe plantigrade high heeled-boots are slightly bigger on the inside, a rare instance of bluespace being used for fashion. Created by a talented physicist with a high heels fetish, but whose ego couldn't stand it when this made his partners taller than him, he later sold the design to a fashion firm. The core technology was adapted to create high heels that were flat-soled for the wearer, aimed at people who had difficulty walking in regular ones."

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

func getPrice():
	return 15

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
	]

func generateItemState():
	itemState = ShirtAndShortsState.new()
	itemState.canActuallyBeDamaged = true

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if(itemState.isSuperDamaged()):
		return {
			"clothing": "res://Modules/HeelsSuitModule/HeelsSuit/HeelsSuitDam3.tscn"
		}
	if(itemState.isDamaged()):
		return {
			"clothing": "res://Modules/HeelsSuitModule/HeelsSuit/HeelsSuitDam2.tscn"
		}
	if(itemState.isHalfDamaged()):
		return {
			"clothing": "res://Modules/HeelsSuitModule/HeelsSuit/HeelsSuitDam1.tscn"
		}
	return {
		"clothing": "res://Modules/HeelsSuitModule/HeelsSuit/HeelsSuit.tscn"
	}

func getHidesParts(_character):
	if(itemState.isRemoved()):
		return null
	var removed = {
		BodypartSlot.Legs: true,
		"panties": true,
	}

	if(!itemState.areShortsPulledDown() && !itemState.isDamaged()):
		removed[BodypartSlot.Penis] = true
	
	if(!itemState.isDamaged()):
			removed[BodypartSlot.Breasts] = true
			removed["bra"] = true
			removed["top"] = true

	return removed

func getInventoryImage():
	return "res://Modules/HeelsSuitModule/HeelsSuit/heelSuitIcon.png"
