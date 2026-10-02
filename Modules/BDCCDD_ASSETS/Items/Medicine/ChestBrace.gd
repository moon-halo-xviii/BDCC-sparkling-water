extends ItemBase

func _init():
	id = DDRef.ChestBrace

func getVisibleName():
	return "Chest Brace"

func getDescription():
	return "Used to treat fractured ribs."

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
	return [DDRef.FractureRib]

func treat(_hitloc, uniqueItemID):
	GM.pc.getInventory().getItemByUniqueID(uniqueItemID).removeXOrDestroy(1)

	GM.pc.getEffect(DDRef.FractureRib).stop()
	
	return "You applied the chest brace to your ribs."