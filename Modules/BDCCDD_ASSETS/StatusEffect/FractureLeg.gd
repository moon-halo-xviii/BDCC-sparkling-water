extends StatusEffectBase

func _init():
	id = DDStatusEffect.FractureLeg

func getBuffs():
	return [
		buff(Buff.RestrainedLegsBuff),
		buff(Buff.DodgeChanceBuff, [-80]),
		buff(Buff.AmbientPainBuff, [30]),
		buff(Buff.RestEffectivenessBuff, [-20]),
	]

func getEffectName():
	return "Leg Fracture"

func getEffectDesc():
	return "One of your legs is seriously messed up."

func getEffectImage():
	return "res://Images/StatusEffects/shattered-heart.png"

func getIconColor():
	return IconColorRed