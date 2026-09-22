extends StatusEffectBase

var bruises = []

func _init():
	id = DDRef.Bruise

func initArgs(_args = []):
	bruises.append_array(_args)
	bruises.sort_custom(HitLoc, "sortHitLocs")

func combine(_args = []):
	for hitLoc in _args:
		if not(hitLoc in bruises):
			bruises.append(hitLoc)
	
	bruises.sort_custom(HitLoc, "sortHitLocs")

func getAfflictedHitLocs():
	return bruises

func getBuffs():
	return [
		buff(Buff.AmbientPainBuff, [5*bruises.size()]),
	]

func getEffectName():
	return "Bruised"

func getEffectDesc():

	var descStr = "You have bruises in the following places:"
	
	for loc in bruises:
		descStr += "\n* "+HitLoc.getName(loc).capitalize()

	descStr += "\n\nMelee attacks on bruised areas inflict 10% additional damage."

	return descStr

func getEffectImage():
	return "res://Images/StatusEffects/shattered-heart.png"

func getIconColor():
	return IconColorDarkPurple

func saveData():
	return {
		"b": bruises,
	}

func loadData(_data):
	bruises = SAVE.loadVar(_data, "b", [])
