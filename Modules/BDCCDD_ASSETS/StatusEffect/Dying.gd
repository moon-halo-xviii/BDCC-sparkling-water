extends StatusEffectBase

var bleedoutTimer = 300

func _init():
	id = DDStatusEffect.Dying

func initArgs(_args = []):
	#The first argument should always be numerical. The second optional argument should be a bool
	#If the second argument is false or not supplied, bleedout is calculated from the severity of the wound that started this status effect (which should be supplied as the first argument)
	#If the second argument is true, the first argument supplies the bleedoutTimer duration directly
	if(_args.size() > 0):
		if(_args.get(1)):
			bleedoutTimer = _args[0]
		else:
			bleedoutTimer = 100 + character.getPainThreshold() - _args[0]

func processTime(_secondsPassed: int):
	bleedoutTimer -= _secondsPassed
	if bleedoutTimer <= 0:
		stop()

func getEffectName():
	return "Dying"

func getEffectDesc():
	return "I'm dying, but it's not over yet... \n"+Util.getTimeStringHumanReadable(bleedoutTimer)+" left until it's over..."

func getEffectImage():
	return "res://Images/StatusEffects/bleeding-wound.png"

func getIconColor():
	return IconColorDarkPurple

func saveData():
	return{
		"bT": bleedoutTimer,
	}

func loadData(_data):
	bleedoutTimer = SAVE.loadVar(_data, "bT", 300)
