extends ItemBase

func _init():
	id = "DD_TestPistol"

func getVisibleName():
	return "Pistol"

func getDescription():
	return "A compact, lethal firearm."

func getAttacks():
	return ["DD_GunAttack"]

func getItemCategory():
	return ItemCategory.Weapons

func getTags():
	return [ItemTag.Illegal]
