extends ItemBase

func _init():
	id = "DD_TestBlade"

func getVisibleName():
	return "Knife"

func getDescription():
	return "A very sharp knife."

func getAttacks():
	return ["DD_BladeAttack"]

func getItemCategory():
	return ItemCategory.Weapons

func getTags():
	return [ItemTag.Illegal]

func getDamageRange():
	return [20,40]