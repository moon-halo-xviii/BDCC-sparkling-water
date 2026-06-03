extends StatusEffectBase

var woundSeverity = 0

func _init():
	id = DDStatusEffect.Bleed
	
func initArgs(_args = []):
	if(_args.size() > 0):
		woundSeverity = _args[0]
	
func processBattleTurn():
	character.addPain(woundSeverity)
	
func processTime(_secondsPassed: int):
	var turnsToProcess = floor(_secondsPassed/30)
	for turn in turnsToProcess:
		if character.getPain() < character.painThreshold():
			character.addPain(woundSeverity)
		else:
			var bloodloss = -1*(woundSeverity - clamp(floor(character.skillsHolder.getStat(Stat.Vitality)/5),0,woundSeverity))/character.painThreshold()
			character.addConsciousness(bloodloss)
			if is_zero_approx(character.getConsciousness()):
				GM.main.IS.startInteraction("Unconscious", {main="pc"})

func getEffectName():
	return "Bleeding"

func getEffectDesc():
	return "I'm losing "+str(woundSeverity)+" health a turn. "

func getEffectImage():
	return "res://Images/StatusEffects/bleeding-wound.png"

func getIconColor():
	return IconColorRed

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)
	else:
		turns = max(3, turns)

func saveData():
	return {
		"wS": woundSeverity,
	}
	
func loadData(_data):
	woundSeverity = SAVE.loadVar(_data, "wS", 3)
