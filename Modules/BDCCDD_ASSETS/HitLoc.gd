extends Node
class_name HitLoc

enum {
	Head,
	Chest,
	ArmLeft,
	ArmRight,
	LegLeft,
	LegRight,
}

static func getAll():
	return [Head, Chest, ArmLeft, ArmRight, LegLeft, LegRight]

static func getName(nuo):
	var num = int(nuo)
	match num:
		Head:
			return "head"
		Chest:
			return "chest"
		ArmLeft:
			return "left arm"
		ArmRight:
			return "right arm"
		LegLeft:
			return "left leg"
		LegRight:
			return "right leg"
		_:
			return "BadHitLoc"

static func sortHitLocs(a, b):
	if a < b:
		return true
	return false
