extends ItemBase

func _init():
	id = DDRef.Suture

func getVisibleName():
	return "Suture"

func getDescription():
	return "Used to close serious lacerations. Instantly stops the most serious bleed on the selected bodypart. Inflicts +10 Pain when used."

func getPossibleActions():
	return [
		{
			"name": "Apply",
			"scene": "DD_MedicineScene",
			"description": "Close one of your open wounds",
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

	GM.pc.addPain(10)

	var bleed = GM.pc.getEffect(injury)

	var bleedingArea = bleed.bleeds[hitloc]

	bleedingArea.sort_custom(self, "woundPriority")

	var woundSeverity = bleedingArea[0][1]

	bleedingArea.pop_front()

	bleed.updateTotalWoundSeverity()

	var descStr = "You stitched up the wound on your %s that was bleeding for %s damage per turn." % [HitLoc.getName(hitloc), woundSeverity]

	return descStr

func woundPriority(woundA, woundB):
	if woundA[1] > woundB[1]:
		return true
	return false