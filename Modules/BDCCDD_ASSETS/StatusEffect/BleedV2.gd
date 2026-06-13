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
				#Reset the consciousness for when they get up. If they never get up, it doesn't matter anyway.
				character.addConsciousness(1.0)
				character.addEffect(DDStatusEffect.Dying, [woundSeverity])
				#Change to a Dying interaction
				GM.main.IS.startInteraction("Unconscious", {main="pc"})
				stop()

func getEffectName():
	if character.getPain() > 0:
		return "Bleeding"
	else:
		return "Acute Blood Loss"

func getEffectDesc():
	if character.getPain() > 0:
		return "I'm losing "+str(woundSeverity)+" health a turn."
	else:
		return "I'm losing a lot of blood... If I don't do something fast, I'll pass out."

func getEffectImage():
	return "res://Images/StatusEffects/bleeding-wound.png"

func getIconColor():
	if character.getPain() > 0:
		return IconColorRed
	else:
		return Color("#911919")

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
