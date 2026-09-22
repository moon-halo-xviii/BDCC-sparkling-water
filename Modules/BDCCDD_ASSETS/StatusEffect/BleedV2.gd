extends StatusEffectBase

var bleeds = {}

var totalWoundSeverity: int

func _init():
	id = DDRef.Bleed
	
func initArgs(_args = []):
	#each element of _args should be an array with three elements: the hit location (hitloc), a wound descriptor (string), and the wound severity  ( [HitLoc.Chest, "Stab Wound", 2] )
	for wound in _args:
		if bleeds.has(wound[0]):
			bleeds[wound[0]].append([wound[1], wound[2]])
		else:
			bleeds[wound[0]] = [[wound[1], wound[2]]]
	updateTotalWoundSeverity()

func updateTotalWoundSeverity():
	totalWoundSeverity = 0
	
	for loc in bleeds.keys():
		var arr = bleeds[loc].duplicate()
		for inj in arr:
			if inj[1] <= 0:
				bleeds[loc].erase(inj)
			else:
				totalWoundSeverity += inj[1]
		if bleeds[loc].size() <= 0:
			bleeds.erase(loc)

	if totalWoundSeverity <= 0:
		stop()

	return totalWoundSeverity

func getBleeds():
	return bleeds

func getAfflictedHitLocs():
	var bleedingHitLocs = []
	for hitloc in bleeds:
		if bleeds[hitloc].size() > 0:
			bleedingHitLocs.append(hitloc)
	return bleedingHitLocs

func processBattleTurn():
	character.addPain(totalWoundSeverity/30)
	
func processTime(_secondsPassed: int):
	#Inflict bleed damage
	var turnsToProcess = floor(_secondsPassed/30)
	for turn in turnsToProcess:
		if character.getPain() < character.painThreshold():
			character.addPain(totalWoundSeverity)
		else:
			var bloodloss = -1*(totalWoundSeverity - clamp(floor(character.skillsHolder.getStat(Stat.Vitality)/5),0,totalWoundSeverity))/character.painThreshold()
			character.addConsciousness(bloodloss)
			if is_zero_approx(character.getConsciousness()):
				#Reset the consciousness for when they get up. If they never get up, it doesn't matter anyway.
				character.addConsciousness(1.0)
				character.addEffect(DDRef.Dying, [totalWoundSeverity])
				#Change to a Dying interaction
				GM.main.IS.startInteraction("Unconscious", {main="pc"})
				stop()

	#Natural healing
	for loc in bleeds.keys():
		for inj in bleeds[loc]:
			inj[1] -= RNG.pickWeightedPairs([[0,2], [1,1],[2,1],[3,1]])
			#if RNG.chance(0.05):
			#	inj.append("willScar")

			if inj[1] <= 0:
				bleeds[loc].erase(inj)
				updateTotalWoundSeverity()

func getEffectName():
	if character.getPain() > 0:
		return "Bleeding"
	else:
		return "Acute Blood Loss"

func getEffectDesc():
	var descStr = "You are bleeding in the following places for a total of {tws} damage:".format({"tws":String(totalWoundSeverity)})
	for loc in bleeds:
		if bleeds[loc].size() == 0:
			continue
		descStr += "\n* "+HitLoc.getName(loc).capitalize()+":"
		for inj in bleeds[loc]:
			descStr += "\n  {woundType} ({woundSeverity})".format({"woundType":inj[0], "woundSeverity":String(inj[1])})
		descStr += "\n"

	return descStr

func getEffectImage():
	return "res://Images/StatusEffects/bleeding-wound.png"

func getIconColor():
	if character.getPain() > 0:
		return IconColorRed
	else:
		return Color("#911919")

func combine(_args = []):
	for wound in _args:
		bleeds[wound[0]].append([wound[1], wound[2]])
	updateTotalWoundSeverity()

func saveData():
	return {
		"bS": bleeds,
		"tws": totalWoundSeverity,
	}
	
func loadData(_data):
	var loadBleed = SAVE.loadVar(_data, "bS")
	totalWoundSeverity = SAVE.loadVar(_data, "tws", 0)

	if loadBleed == null:
		stop()

	# HitLoc enum keys will load as strings, necessitating the type conversion here 
	for stringKey in loadBleed.keys():
		bleeds[int(stringKey)] = loadBleed[stringKey]
