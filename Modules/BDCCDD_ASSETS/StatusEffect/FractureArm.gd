extends StatusEffectBase

func _init():
	id = DDStatusEffect.FractureArm

func getBuffs():
	return [
		buff(Buff.RestrainedArmsBuff),
		buff(Buff.AmbientPainBuff, [30]),
		buff(Buff.RestEffectivenessBuff, [-20]),
	]

func getEffectName():
	return "Arm Fracture"

func getEffectDesc():
	return "One of your arms is seriously messed up."

func getEffectImage():
	return "res://Images/StatusEffects/shattered-heart.png"

func getIconColor():
	return IconColorRed