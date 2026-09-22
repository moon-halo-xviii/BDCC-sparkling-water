extends SceneBase

var uniqueItemID = ""
var partToTreat = ""

func _init():
	sceneID = "DD_MedicineScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]
	

func _reactInit():
	if(uniqueItemID == null || uniqueItemID == ""):
		return
	var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
	
	for injury in item.treatableEffects():
		if GM.pc.hasEffect(injury):
			setState("selectBodypart")
			break


func _run():
	var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
	
	if(state == ""):
		say("You have no wounds that this item can treat right now.")
		addButton("Continue", "Return to the previous menu", "endthescene")
	
	if(state == "selectBodypart"):
		saynn("Select the bodypart you wish to treat:")

		addButton("RETURN", "Return to the previous menu", "endthescene")

		var validParts = []

		for injury in item.treatableEffects():
			if GM.pc.hasEffect(injury):
				for hitloc in GM.pc.getEffect(injury).getAfflictedHitLocs():
					if not(hitloc in validParts):
						validParts.append(hitloc)
		
		validParts.sort_custom(HitLoc, "sortHitLocs")

		for hitloc in validParts:
			addButton(HitLoc.getName(hitloc).capitalize(), "Select this bodypart", "treatBodypart", [hitloc])

	if(state == "treatBodypart"):
		for injury in item.treatableEffects():
			saynn(item.treat(injury, partToTreat, uniqueItemID))
			addButton("Continue", "Return to inventory", "endthescene")

func _react(_action: String, _args):
	if(_action == "treatBodypart"):
		partToTreat = _args[0]

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func saveData():
	return {
		"uID": uniqueItemID,
		"ptt": partToTreat, 
	}

func loadData(_data):
	uniqueItemID = SAVE.loadVar(_data, "uID", "")
	partToTreat = SAVE.loadVar(_data, "ptt", "")
