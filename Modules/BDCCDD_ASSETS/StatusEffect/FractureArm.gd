extends StatusEffectBase

var fracs: Array = []

func _init():
	id = DDRef.FractureArm

func initArgs(_args = []):
	fracs = _args

func getBuffs():
	var mult = fracs.size()
	return [
		buff(Buff.AmbientPainBuff, [30*mult]),
		buff(Buff.RestEffectivenessBuff, [-20*mult]),
	]

func getAfflictedHitLocs():
	return fracs

func getEffectName():
	return "Arm Fracture"

func getEffectDesc():
	if fracs.size() >= 2:
		return "Both of your arms are seriously messed up."
	
	if fracs.has(HitLoc.ArmLeft):
		return "Your left arm is seriously messed up."

	if fracs.has(HitLoc.ArmRight):
		return "Your right arm is seriously messed up."

	return "BADINJURY"

func update():
	if fracs.size() == 0:
		stop()

func getEffectImage():
	return "res://Images/StatusEffects/shattered-heart.png"

func getIconColor():
	return IconColorRed

func combine(_args = []):
	for i in _args:
		if not(i in fracs):
			fracs.append(i)

func saveData():
	return {
		"ArmFr": fracs
	}
	
func loadData(_data):
	fracs = SAVE.loadVar(_data, "ArmFr")
