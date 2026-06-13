extends StatusEffectBase

func _init():
	id = DDStatusEffect.Bruise

func getBuffs():
	return [
		buff(Buff.AmbientPainBuff, [30]),
	]

func getEffectName():
	return "Bruise"

func getEffectDesc():
	return "You have a bruise... Somewhere."

func getEffectImage():
	return "res://Images/StatusEffects/shattered-heart.png"

func getIconColor():
	return IconColorDarkPurple