extends StatusEffectBase

var stabs = []

func _init():
	id = DDRef.StabWound

func initArgs(_args = []):
	stabs.append_array(_args)
	stabs.sort_custom(HitLoc, "sortHitLocs")

func combine(_args = []):
	for hitLoc in _args:
		if not(hitLoc in stabs):
			stabs.append(hitLoc)
	
	stabs.sort_custom(HitLoc, "sortHitLocs")

func getBuffs():
	return [
		buff(Buff.AmbientPainBuff, [5*stabs.size()]),
	]

func getEffectName():
	return "Bruised"

func getEffectDesc():

	var descStr = "You have stab wounds in the following places:"
	
	for loc in stabs:
		descStr += "\n* "+HitLoc.getName(loc).capitalize()

	descStr += "\n\nStab wounds bleed unless bandaged or sutured."

	return descStr

func getEffectImage():
	return "res://Images/StatusEffects/open-wound.png"

func getIconColor():
	return IconColorRed

func saveData():
	return {
		"b": stabs,
	}

func loadData(_data):
	stabs = SAVE.loadVar(_data, "b", [])
