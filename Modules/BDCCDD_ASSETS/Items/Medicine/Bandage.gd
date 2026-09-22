extends ItemBase

func _init():
	id = DDRef.Bandage

func getVisibleName():
	return "Bandage"

func getDescription():
	return "Used to treat minor bleeds. Reduces the severity of all bleeds on a given bodypart by 10 points."

func getPossibleActions():
	return [
		{
			"name": "Apply",
			"scene": "DD_MedicineScene",
			"description": "Treat one of your bleeding wounds",
		}
	]

func canCombine():
	return true

func getItemCategory():
	return ItemCategory.Medical

func canUseInCombat():
	return false

func treatableEffects():
	return [DDRef.Bleed]

func treat(injury, hitloc, uniqueItemID):
	GM.pc.getInventory().getItemByUniqueID(uniqueItemID).removeXOrDestroy(1)

	var bleed = GM.pc.getEffect(injury)
	
	for wound in bleed.bleeds[hitloc]:
		wound[1] -= 5

	var newWoundSeverity = bleed.updateTotalWoundSeverity()

	var descStr = "You wrapped the bandage around your %s. " % HitLoc.getName(hitloc)

	if newWoundSeverity <= 0:
		descStr += "The bleeding has stopped."
	else:
		if newWoundSeverity < 2:
			descStr += "It's still bleeding a little."
		elif newWoundSeverity < 5:
			descStr += "It's still bleeding quite a bit, though."
		else:
			descStr += "It isn't very effective."

	return descStr
