extends SceneBase

var charArray = []
var selectedChar = null
var dpID = null
var charRef = ""

var importName = true
var importPersonality = true
var importFetishes = true
var importClothes = true

func _init():
	sceneID = "DC2PScene"

func _run():
	if(state == ""):
		if(dpID in GM.main.loadedDatapacks):
			GM.main.unloadDatapack(dpID)
		addButton("Back","Return to the previous menu","endreturn")
		for datapackID in GlobalRegistry.datapacks:			
			addButton(datapackID, "Pick this datapack", "dpselect", [datapackID])
		saynn("Select the datapack you wish to use")

	if(state == "dpinfo"):
		GM.main.loadDatapackAndDependencies(dpID)
		clearCharacter()
		playAnimation(StageScene.Solo,"stand")
		saynn("Select your character")
		addButton("Back", "Return to datapack selection","")
		for charID in charArray:
			addButton(charID.id,"select this character","charselect",[charID])

	if(state == "charinfo"):
		if(selectedChar == null):
			saynn("Oops! Something went wrong")
			addButton("Back", "return to character selection", "importOptions")
		else:
			saynn("Name: "+selectedChar.name)
			saynn("Description: "+selectedChar.description)
			saynn("Gender: "+Gender.genderToString(selectedChar.gender))

			if(selectedChar.personality.size() > 0):
				saynn("\nPersonality:")
				for personalityStat in selectedChar.personality:
					saynn(personalityStat+": "+PersonalityStat.getVisibleDesc(personalityStat, selectedChar.personality[personalityStat]))

			if(selectedChar.fetishes.size() > 0):
				saynn("\nFetishes:")
				for fetish in selectedChar.fetishes:
					if typeof(selectedChar.fetishes[fetish]) == TYPE_REAL:
						saynn(fetish+": "+FetishInterest.getVisibleName(selectedChar.fetishes[fetish]).capitalize())
					else: #legacy support
						saynn(fetish+": "+str(selectedChar.fetishes[fetish]))

			charRef = dpID+":"+selectedChar.id

#			addCharacter(charRef)
			playAnimation(StageScene.Solo,"stand",{pc=charRef})
			addButton("Back", "Return to character selection", "dpinfo")
			addButton("Select","Use this character","importOptions")

	if(state == "importOptions"):
		addButton("Back","Review character info","charinfo")

		saynn("\n[b]Use the buttons below to configure your import settings, and then press Confirm to continue[/b]\n")

		saynn("Use Character's Name: "+str(importName))		
		addButton("Name", "Toggle Character Name", "toggleName")

		if(selectedChar.personality.size() > 0):
			saynn("Use Character's Personality: "+str(importPersonality))
			addButton("Personality", "Toggle Character Personality", "togglePersonality")
		
		if(selectedChar.fetishes.size() > 0):
			saynn("Use Character's Fetishes: "+str(importFetishes))
			addButton("Fetishes","Toggle Character Personality", "toggleFetishes")
		
		saynn("Put Character's Clothes In Inventory: "+str(importClothes))
		addButton("Clothes","Toggle Clothes", "toggleClothes")


		saynn("\nAfter importing, you will be brought to the character creation menu, where you can edit the character further")
		
		addButton("Confirm","Use these settings and continue","datapackCharacterImport")
	
	if(state == "finish"):
		saynn("Import successful! You will now be brought to the character creation menu, where you can edit the character further")

		addButton("Continue", "Proceed to character creation", "endthescene")

func _react(_action: String, _args):
	if(_action == "dpselect"):
		dpID = _args[0]
		var theDatapack:Datapack = GlobalRegistry.getDatapack(dpID)

		charArray.clear()
		var newCharacters = theDatapack.characters

		for charID in newCharacters:
			charArray.append(newCharacters[charID])
		
		setState("dpinfo")
		return

	if(_action == "charselect"):
		selectedChar = _args[0]
		setState("charinfo")
		return

	if(_action == "toggleName"):
		importName = !importName
		setState("importOptions")
		return

	if(_action == "togglePersonality"):
		importPersonality = !importPersonality
		setState("importOptions")
		return

	if(_action == "toggleFetishes"):
		importFetishes = !importFetishes
		setState("importOptions")
		return

	if(_action == "toggleClothes"):
		importClothes = !importClothes
		setState("importOptions")
		return

	if(_action == "datapackCharacterImport"):
#		removeCharacter(charRef)
		GM.main.unloadDatapack(dpID)
		GM.pc.setGender(selectedChar.gender)
		GM.pc.setPronounGender(selectedChar.pronounsGender)
		GM.pc.setSpecies(selectedChar.species)

		var loadedBodyparts = selectedChar.bodyparts
		
		#new removal sequence is necessary for datapack characters with empty slots that weren't explicitly selected as "-Nothing-"; this tends to be the tail
		for slot in BodypartSlot.getAll():
			if(not(slot in loadedBodyparts)):
				GM.pc.removeBodypart(slot)
		
		for slot in loadedBodyparts:
			if(loadedBodyparts[slot] == null || loadedBodyparts[slot]["id"] == "" || loadedBodyparts[slot]["id"] == null):
				GM.pc.removeBodypart(slot)
				continue
			var id = SAVE.loadVar(loadedBodyparts[slot], "id", "errorbad")
			var bodypart = GlobalRegistry.createBodypart(id)

			var bodypartAttribs = SAVE.loadVar(loadedBodyparts[slot], "data", {})
			for attribID in bodypartAttribs:
				bodypart.applyAttribute(attribID, bodypartAttribs[attribID])
			if(loadedBodyparts[slot].has("pickedSkin")):
				bodypart.pickedSkin = loadedBodyparts[slot]["pickedSkin"]
				if(bodypart.pickedSkin == ""):
					bodypart.pickedSkin = null
			if(loadedBodyparts[slot].has("pickedR")):
				bodypart.pickedRColor = loadedBodyparts[slot]["pickedR"]
			if(loadedBodyparts[slot].has("pickedG")):
				bodypart.pickedGColor = loadedBodyparts[slot]["pickedG"]
			if(loadedBodyparts[slot].has("pickedB")):
				bodypart.pickedBColor = loadedBodyparts[slot]["pickedB"]
			GM.pc.giveBodypart(bodypart, false)
		
		GM.pc.pickedSkin = selectedChar.pickedSkin
		GM.pc.pickedSkinRColor = selectedChar.pickedSkinRColor
		GM.pc.pickedSkinGColor = selectedChar.pickedSkinGColor
		GM.pc.pickedSkinBColor = selectedChar.pickedSkinBColor

		setFlag("PickedSkinAtLeastOnce", true)

		GM.pc.pickedFemininity = selectedChar.femininity
		GM.pc.pickedThickness = selectedChar.thickness

		if(importName):
			GM.pc.setName(selectedChar.name)

		if(importPersonality):
			var personality = GM.pc.getPersonality()

			for personalityStat in selectedChar.personality:
				personality.setStat(personalityStat, selectedChar.personality[personalityStat])

		if(importFetishes):
			var fetishes = GM.pc.getFetishHolder()
			
			for fetish in selectedChar.fetishes:
				if typeof(selectedChar.fetishes[fetish]) == TYPE_REAL:		
					fetishes.setFetish(fetish, selectedChar.fetishes[fetish])
				else: #legacy support
					fetishes.setFetish(fetish, FetishInterest.textToNumber(selectedChar.fetishes[fetish]))

		if(importClothes):
			var playerInventory = GM.pc.getInventory()
			for slot in selectedChar.equippedItems:
				if((slot in InventorySlot.getAll()) && (slot != "neck")): #you wouldn't be able to remove your collar to put it on anyway
					var item = selectedChar.equippedItems[slot]["id"]
					if(not(item in ["inmateuniform", "inmateuniformHighsec", "inmateuniformSexDeviant"])):
						playerInventory.addItem(GlobalRegistry.createItem(item))

		setState("finish")
		return

	if(_action == "endreturn"):
		endScene()
		return

	if(_action == "endthescene"):
		GM.main.sceneStack[1].state = "pickedspecies"
		endScene()
		return
	
	setState(_action)
