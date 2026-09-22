extends ItemBase

func _init():
	id = DDRef.Splint

func getVisibleName():
	return "Splint"

func getDescription():
	return "Used to treat bone fractures."

func getPossibleActions():
	return [
		{
			"name": "Apply",
			"scene": "DD_MedicineScene",
			"description": "Tend to one of your fractures."
		}
	]

func canCombine():
	return true

func getItemCategory():
	return ItemCategory.Medical

func canUseInCombat():
	return false

func treatableEffects():
	return [DDRef.FractureArm, DDRef.FractureLeg, DDRef.FractureRib]

func treat(injury, hitloc, uniqueItemID):
	GM.pc.getInventory().getItemByUniqueID(uniqueItemID).removeXOrDestroy(1)

	var fracture = GM.pc.getEffect(injury)

	#Rib Fracture
	if hitloc == HitLoc.Chest:
		fracture.stop()
		return "You applied the splint to your ribs."

	#Arm or Leg Fracture
	fracture.fracs.erase(hitloc)
	fracture.update()
	return "You applied the splint to your %s." % [HitLoc.getName(hitloc)]
