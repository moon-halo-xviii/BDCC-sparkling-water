extends StatusEffectBase

func _init():
	id = DDStatusEffect.FractureRib

func getBuffs():
	return [
		buff(Buff.DodgeChanceBuff, [-50]),
		buff(Buff.MaxPainBuff, [-50]),
		buff(Buff.MaxStaminaBuff, [-75]),
		buff(Buff.AmbientPainBuff, [50]),
		buff(Buff.RestEffectivenessBuff, [-50]),
	]

func getEffectName():
	return "Rib Fracture"

func getEffectDesc():
	return "Your ribs are seriously messed up. You should see a doctor as soon as possible."

func getEffectImage():
	return "res://Images/StatusEffects/shattered-heart.png"

func getIconColor():
	return IconColorRed