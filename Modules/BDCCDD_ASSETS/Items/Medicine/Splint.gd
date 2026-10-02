extends ItemBase

func _init():
	id = DDRef.Splint

func getVisibleName():
	return "Limb Splint"

func getDescription():
	return "Used to treat fractured limbs."

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
	return [DDRef.FractureArm, DDRef.FractureLeg]

func treat(hitloc, uniqueItemID):

	#Rib Fracture
#	if hitloc == HitLoc.Chest:
#		fracture.stop()
#		return "You applied the splint to your ribs."

	#Arm or Leg Fracture

	var fracture

	match hitloc:
		HitLoc.ArmLeft, HitLoc.ArmRight:
			fracture = GM.pc.getEffect(DDRef.FractureArm)
		HitLoc.LegLeft, HitLoc.LegRight:
			fracture = GM.pc.getEffect(DDRef.FractureLeg)			

	if fracture == null:
		return "ERROR: DD_Splint attempted to treat a null fracture at "+HitLoc.getName(hitloc)

	GM.pc.getInventory().getItemByUniqueID(uniqueItemID).removeXOrDestroy(1)

	fracture.fracs.erase(hitloc)
	fracture.update()
	return "You applied the splint to your %s." % [HitLoc.getName(hitloc)]
