extends ItemBase

func _init():
	id = "DD_TestBat"

func getVisibleName():
	return "Baseball Bat"

func getDescription():
	return "A baseball bat shaped like a stun baton."

func getAttacks():
	return ["DD_BasicBluntAttack"]

func getItemCategory():
	return ItemCategory.Weapons

func getTags():
	return [ItemTag.Illegal]

func getDamageRange():
	return [25,50]