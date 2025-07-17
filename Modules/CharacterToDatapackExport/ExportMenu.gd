extends SceneBase



var target = null
var targetType = null #"Player", "Static", "Dynamic"

var npclistscene = preload("res://Modules/CharacterToDatapackExport/ExportNpcList.tscn")
var pickedPoolToShow = ""

var ignoreTF = false
var tfHolder = null
var ogdata = null

var characterID = null
var datapackID = null

var isNewDatapack = false

func _init():
	sceneID = "ExportMenu"

func _run():
	if(state == ""):
		saynn("What do you want to export?")

		addButton("Cancel", "Go back", "endthescene")
		addButton("Player", "Export yourself", "exportPlayer")
		addButton("NPC", "Export a dynamic NPC", "exportNPClistmenu")

	if(state == "exportNPClistmenu"):
		var encounterPools = GM.main.getDynamicCharactersPools()
		addButton("Cancel", "Go back", "")
		for encounterPoolID in encounterPools:
			addButton(str(encounterPoolID), "Pick this occupation", "occupationmenupool", [encounterPoolID])

	if(state == "occupationmenupool"):
		var npclist = npclistscene.instance()
		GM.ui.addCustomControl("npclist", npclist)
		var _ok = npclist.connect("onExportPressed", self, "onExportPressed")

		var characterIDs = GM.main.getDynamicCharacterIDsFromPool(pickedPoolToShow)
		for xCharacterID in characterIDs:
			var dynamicCharacter:BaseCharacter = GlobalRegistry.getCharacter(xCharacterID)
			if(dynamicCharacter == null):
				continue
			var npcName = dynamicCharacter.getName()
			var gender = NpcGender.getVisibleName(dynamicCharacter.npcGeneratedGender)
			var species =  dynamicCharacter.getSpeciesFullName()
			npclist.addRow(npcName, gender, species, xCharacterID, pickedPoolToShow, dynamicCharacter.canMeetCharacter())

		addButton("Cancel", "Go back", "")
		var encounterPools = GM.main.getDynamicCharactersPools()
		for encounterPoolID in encounterPools:
			addButton(str(encounterPoolID), "Pick this occupation", "occupationmenupool", [encounterPoolID])

	if(state == "exportNPC"):
		saynn("You did it?")
		addButton("Continue", "Continue", "promptCharID")

	if(state == "promptCharID"):
		say("Set the character's ID:")

		var textBox:LineEdit = addTextbox("characterID")
		var _ok = textBox.connect("text_entered", self, "onCharTextBoxEnterPressed")

		addButton("Back", "Go back", "promptIDBack")
		addButton("Confirm", "Choose this ID", "setCharID")

	if(state == "promptDatapack"):
		saynn("Select which datapack you want to save this character to, or make a new one.")
		addButton("Back", "Go back", "promptCharID")
		addButton("Create new", "Make a new datapack", "promptDatapackID")
		for datapack in GlobalRegistry.datapacks:
			addButton(datapack, "Select this datapack", "setDatapack", [datapack])
	
	if(state == "promptDatapackID"):
		saynn("Set the datapack ID:")
		var textBox:LineEdit = addTextbox("datapackID")
		var _ok = textBox.connect("text_entered", self, "onDatapackTextBoxEnterPressed")
		addButton("Back", "Go back", "promptDatapack")
		addButton("Confirm", "Choose this ID", "setDatapackID")

	if(state == "reviewConfig"):
		if(targetType == "Player"):
			playAnimation(StageScene.Solo, "stand")
		else:
			pass
		saynn("Selected Character: "+target.getName())
		saynn("ID: "+characterID)
		saynn("Writing to: "+datapackID)
		saynn("Ignore Transformations: "+str(ignoreTF))

		addButton("Back", "Go back", "promptDatapack")
		addButton("Toggle TF", ("Use the character's original body" if ignoreTF else "Use the character's temporary transformations"), "toggleIgnoreTF")
		addButton("Confirm", "Export using these settings", "runExport")
		
	if(state == "finished"):
		saynn("Export finished.")
		addButton("Continue", "Return to the player menu", "endthescene")

func onCharTextBoxEnterPressed(_new_text:String):
	GM.main.pickOption("setCharID", [])

func onDatapackTextBoxEnterPressed(_new_text:String):
	GM.main.pickOption("setDatapackID", [])

func onExportPressed(_charID:String):
	target = GlobalRegistry.getCharacter(_charID)
	targetType = "Dynamic"
	GM.main.pickOption("promptCharID", [])

func _react(_action: String, _args):
	if(_action == "exportPlayer"):
		target = GM.pc
		targetType = "Player"
		setState("promptCharID")
		return

	if(_action == "occupationmenupool"):
		pickedPoolToShow = _args[0]

	if(_action == "setCharID"):
		if(getTextboxData("characterID") == ""):
			return
		
		characterID = getTextboxData("characterID")
		setState("promptDatapack")
		return
	
	if(_action == "setDatapackID"):
		var candidate = getTextboxData("datapackID")
		if(candidate == ""):
			return
		elif(GlobalRegistry.datapacks.has(candidate)):
			addMessage("Datapack with this ID already exists")
			return
		datapackID = candidate
		isNewDatapack = true
		setState("reviewConfig")
		return
		
	if(_action == "setDatapack"):
		datapackID = _args[0]
		setState("reviewConfig")
		return

	if(_action == "promptIDBack"):
		if(targetType == "Player"):
			setState("")
		else:
			setState("exportNPClistmenu")
		return

	if(_action == "toggleIgnoreTF"):
		ignoreTF = !ignoreTF
		setState("reviewConfig")
		return

	if(_action == "runExport"):
		if(isNewDatapack == true):
			var newDatapack:Datapack = Datapack.new()
			newDatapack.id = datapackID
			newDatapack.name = datapackID
			var _ok = newDatapack.saveToDisk()
			if(!_ok):
				Log.printerr("ExportMenu.gd: error saving datapack to disk")
				return
			GlobalRegistry.datapacks[newDatapack.id] = newDatapack

		var datapack = GlobalRegistry.getDatapacks()[datapackID]					
		var newDatapackCharacter:DatapackCharacter = DatapackCharacter.new()
		newDatapackCharacter.id = characterID

		#standard attribute assignments
		newDatapackCharacter.name = target.getName()
		newDatapackCharacter.inmateType = target.getInmateType()

		if(targetType == "Player"):
			newDatapackCharacter.description = "An imported player character"
		elif(targetType == "Dynamic"):
			newDatapackCharacter.description = "An imported dynamic character"
			newDatapackCharacter.customSpeciesName = target.npcCustomSpeciesName
		
		tfHolder = target.getTFHolder()

		#transformation assignments
		if(ignoreTF):
			ogdata = tfHolder.grabCharOriginalData()
			newDatapackCharacter.gender = ogdata["gender"]
			newDatapackCharacter.pronounsGender = ogdata["pronounsGender"]
			newDatapackCharacter.femininity = ogdata["femininity"]
			newDatapackCharacter.thickness = ogdata["thickness"]
			newDatapackCharacter.species = ogdata["species"]

			newDatapackCharacter.pickedSkin = ogdata["pickedSkin"]
			newDatapackCharacter.pickedSkinRColor = ogdata["pickedSkinRColor"]
			newDatapackCharacter.pickedSkinGColor = ogdata["pickedSkinGColor"]
			newDatapackCharacter.pickedSkinBColor = ogdata["pickedSkinBColor"]

		else:
			newDatapackCharacter.gender = target.getGender()
			newDatapackCharacter.pronounsGender = target.getPronounGender()
			newDatapackCharacter.femininity = target.getFemininity()
			newDatapackCharacter.thickness = target.getThickness()
			newDatapackCharacter.species = target.getSpecies()

			newDatapackCharacter.pickedSkin = target.getBaseSkinID()
			var bodycolor = target.getBaseSkinColors()
			newDatapackCharacter.pickedSkinRColor = bodycolor[0]
			newDatapackCharacter.pickedSkinGColor = bodycolor[1]
			newDatapackCharacter.pickedSkinBColor = bodycolor[2]

		#intangible assignments 
		newDatapackCharacter.level = target.getLevel()
		newDatapackCharacter.stats = target.skillsHolder.stats
		newDatapackCharacter.perks = target.skillsHolder.getPerks().keys()

		newDatapackCharacter.attacks = ["biteattack", "simplekickattack", "shoveattack", "NpcScratch"]
		
		#personality and fetish assignment
		for stat in PersonalityStat.getAll():
			newDatapackCharacter.personality[stat] = target.personality.getStat(stat)

		newDatapackCharacter.fetishes = target.fetishHolder.getFetishes()

		# bodypart assignment
		var bodyparts:Dictionary = {}

		var template = SAVE.loadVar(target.saveData(), "bodyparts", {}).duplicate()

		for slot in template:
			if(template[slot] == null || template[slot]["id"] == "" || template[slot]["id"] == null):
				continue

			if(ignoreTF && tfHolder != null):
				if(slot in tfHolder.affectedParts):
					template[slot]["id"] = tfHolder.grabBodypartOriginalData(slot)["bodypartID"]
					if("partskin" in ogdata["partsSkins"][slot]):
						template[slot]["data"]["pickedSkin"] = ogdata["partsSkins"][slot]["partskin"]
					template[slot]["data"]["pickedRColor"] = ogdata["partsSkins"][slot]["r"]
					template[slot]["data"]["pickedGColor"] = ogdata["partsSkins"][slot]["g"]
					template[slot]["data"]["pickedBColor"] = ogdata["partsSkins"][slot]["b"]

					match slot:
						"breasts":
							template[slot]["data"]["size"] = tfHolder.grabBodypartOriginalData("breasts")["size"]
						"penis":
							template[slot]["data"]["lengthCM"] = tfHolder.grabBodypartOriginalData("penis")["lengthCM"]
							template[slot]["data"]["ballsScale"] = tfHolder.grabBodypartOriginalData("penis")["ballsScale"]
						"tail":
							template[slot]["data"]["tailScale"] = tfHolder.grabBodypartOriginalData("penis")["tailScale"]

			var id = SAVE.loadVar(template[slot],"id","errorbad")

			var attribDict:Dictionary = {}

			match slot: #lousy but no better way to associate attribute names to their respective variables
				"breasts":
					attribDict["breastsize"] = template[slot]["data"]["size"]
				"penis":
					attribDict["cocksize"] = template[slot]["data"]["lengthCM"]
					attribDict["ballsscale"] = template[slot]["data"]["ballsScale"]
				"tail":
					attribDict["tailscale"] = template[slot]["data"]["tailScale"]

			var bodypart = {
				"id": id,
				"data": attribDict,
			}

			if("pickedSkin" in template[slot]["data"]):
				bodypart["pickedSkin"] = template[slot]["data"]["pickedSkin"]
				for color in ["pickedR", "pickedG", "pickedB"]:
					if template[slot]["data"][color+"Color"] != null:
						bodypart[color] = Color(template[slot]["data"][color+"Color"])
					else:
						bodypart[color] = null

			bodyparts[slot] = bodypart

		newDatapackCharacter.bodyparts = bodyparts

		#inventory assignment
		var equippedItems = {}
		var ref = target.inventory.getEquippedItems()
		for slot in ref:
			equippedItems[slot] = {}
			equippedItems[slot]["id"] = ref[slot]["id"]
			equippedItems[slot]["data"] = {}
			var editVars = ref[slot].getDatapackEditVars()
			for value in editVars:
				equippedItems[slot]["data"][value] = editVars[value]["value"]
		newDatapackCharacter.equippedItems = equippedItems

		#write to datapack
		datapack.characters[characterID] = newDatapackCharacter
		var _ok = datapack.saveToDisk()
		if (!_ok):
			print("Something went wrong")
		else:
			setState("finished")
		return

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

# func saveData():
# 	return {
# 		"name": name,
# 		"description": description,
# 		"gender": gender,
# 		"pronounsGender": pronounsGender,
# 		"femininity": femininity,
# 		"thickness": thickness,
# 		"hasChatColor": hasChatColor,
# 		"chatColor": chatColor.to_html(),
# 		"species": species,
# 		"customSpeciesName": customSpeciesName,
# 		"bodyparts": bodyparts,
# 		"pickedSkin": pickedSkin,
# 		"pickedSkinRColor": pickedSkinRColor.to_html(),
# 		"pickedSkinGColor": pickedSkinGColor.to_html(),
# 		"pickedSkinBColor": pickedSkinBColor.to_html(),
# 		"characterType": characterType,
# 		"inmateType": inmateType,
# 		"equippedItems": equippedItems,
# 		"attacks": attacks,
# 		"personality": personality,
# 		"fetishes": fetishes,
# 		"lustInterests": lustInterests,
# 		"stats": stats,
# 		"perks": perks,
# 		"level": level,
# 		"basePain": basePain,
# 		"baseLust": baseLust,
# 		"baseStamina": baseStamina,
# 		"portrait": portrait.saveData(),
# 		"portraitNaked": portraitNaked.saveData(),
# 		"lootTableID": lootTableID,
# 		"lootCreditsChance": lootCreditsChance,
# 		"lootCreditsMin": lootCreditsMin,
# 		"lootCreditsMax": lootCreditsMax,
# 		"lootExtra": lootExtra,
# 		"excludeEncounters": excludeEncounters,
# 		"disableForget": disableForget,
# 		"disableBirth": disableBirth,
# 		"disableMeet": disableMeet,
# 		"restraintDodgeChanceMult": restraintDodgeChanceMult,
# 		"restraintStrugglePower": restraintStrugglePower,
# 	}
