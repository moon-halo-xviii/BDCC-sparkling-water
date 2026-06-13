extends StatusEffectBase

func _init():
	id = DDStatusEffect.Headache

func getBuffs():
	return [
		buff(Buff.AmbientPainBuff, [5]),
		buff(Buff.DodgeChanceBuff, [-5]),
		buff(Buff.LustArmorBuff, [10]),
		buff(Buff.LustDamageBuff, [-10]),
	]

func getEffectName():
	return "Headache"

func getEffectDesc():
	return "You have a headache."

func getEffectImage():
	return "res://Images/StatusEffects/shattered-heart.png"

func getIconColor():
	return IconColorDarkPurple