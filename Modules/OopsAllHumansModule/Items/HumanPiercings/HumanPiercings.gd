extends ItemBase

func _init():
	id = "HumanPiercings"

func getVisibleName():
	return "Human piercings"

func getDescription():
	return "Piercings for your human!"

func getClothingSlot():
	return InventorySlot.Unique

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"headpiercings": "res://Modules/OopsAllHumansModule/Items/HumanPiercings/HumanPiercings.tscn",
	}

func canDye():
	return true