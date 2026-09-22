extends StatusEffectBase

var fracs: Array = []

func _init():
	id = DDRef.FractureLeg

func initArgs(_args = []):
	fracs = _args

func getBuffs():
	var mult = fracs.size()

	return [
		buff(Buff.DodgeChanceBuff, [-40*mult]),
		buff(Buff.AmbientPainBuff, [30*mult]),
		buff(Buff.RestEffectivenessBuff, [-20*mult]),
	]

func getAfflictedHitLocs():
	return fracs

func getEffectName():
	return "Leg Fracture"

func getEffectDesc():
	if fracs.size() >= 2:
		return "Both of your legs are seriously messed up."
	
	if fracs.has(HitLoc.LegLeft):
		return "Your left leg is seriously messed up."

	if fracs.has(HitLoc.LegRight):
		return "Your right leg is seriously messed up."

	return "BADINJURY"

func combine(_args = []):
	for i in _args:
		if not(i in fracs):
			fracs.append(i)

func update():
	if fracs.size() == 0:
		stop()

func getEffectImage():
	return "res://Images/StatusEffects/shattered-heart.png"

func getIconColor():
	return IconColorRed

func saveData():
	return {
		"LegFr": fracs
	}
	
func loadData(_data):
	fracs = SAVE.loadVar(_data, "LegFr")
