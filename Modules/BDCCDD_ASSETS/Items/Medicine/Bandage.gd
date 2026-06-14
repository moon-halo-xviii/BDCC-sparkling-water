extends ItemBase

func _init():
	id = DDRef.Bandage

func getVisibleName():
	return "Bandage"

func getDescription():
	return "Used to treat minor wounds"

func getPossibleActions():
	return [
		{
			"name": "Apply",
			"scene": "DD_MedicineScene",
			"description": "Treat one of your wounds",
		}
	]

func canCombine():
	return true

func getItemCategory():
	return ItemCategory.Medical