extends SceneBase

var target = null
var characterID = null
var datapackID = null
var newDatapack = false

func _init():
	sceneID = "ExportMenu"

func _run():
	if(state == ""):
		saynn("What do you want to export?")

		addButton("Cancel", "Go back", "endthescene")
		addButton("Player", "Export yourself", "exportPlayer")
		addDisabledButton("NPC", "Export a dynamic NPC")

	if(state == "promptID"):
		say("Set the character's ID:")

		var textBox:LineEdit = addTextbox("characterID")
		var _ok = textBox.connect("text_entered", self, "onTextBoxEnterPressed")

		addButton("Back", "Go back", "promptIDBack")
		addButton("Confirm", "Choose this ID", "setID")

	if(state == "promptDatapack"):
		saynn("Select which datapack you want to save this character to, or make a new one.")
		addButton("Back", "Go back", "promptID")
		for datapack in GlobalRegistry.datapacks:
			addButton(datapack, "Select this datapack", "setDatapack", [datapack])

	if(state == "reviewConfig"):
		if(target == "Player"):
			playAnimation(StageScene.Solo, "stand")
		else:
			pass
		saynn("Selected Character: "+(target.npcName if not(target == "Player") else GM.pc.gamename))
		saynn("ID: "+characterID)
		saynn("Writing to: "+datapackID)

		addButton("Back", "Go back", "promptDatapack")
		addButton("Confirm", "Export using these settings", "runExport")

func onTextBoxEnterPressed(_new_text:String):
	GM.main.pickOption("setID", [])

func _react(_action: String, _args):
	if(_action == "exportPlayer"):
		target = "Player"
		setState("promptID")
		return

	if(_action == "setID"):
		if(getTextboxData("characterID") == ""):
			return
		
		characterID = getTextboxData("characterID")
		setState("promptDatapack")
		return
		
	if(_action == "setDatapack"):
		datapackID = _args[0]
		setState("reviewConfig")
		return

	if(_action == "promptIDBack"):
		if(target == "Player"):
			setState("")
		else:
			pass
		return

	if(_action == "runExport"):
		if(newDatapack == true):
			pass

		var datapack = GlobalRegistry.getDatapacks()[datapackID]					
		var newDatapackCharacter:DatapackCharacter = DatapackCharacter.new()
		newDatapackCharacter.id = characterID
		datapack.characters[characterID] = newDatapackCharacter		

		if(target == "Player"):
			var template = GM.pc.bodyparts
			for slot in template:
				if(template[slot] == null || template[slot]["id"] == "" || template[slot]["id"] == null):
					continue

				var bodypart = GlobalRegistry.createBodypart(template[slot].id)
				var bodypartAttribs = SAVE.loadVar(template[slot], "data", {})
				for attribID in bodypartAttribs:
					bodypart.applyAttribute(attribID, bodypartAttribs[attribID])

				bodypart.pickedSkin = template[slot].pickedSkin
				bodypart.pickedRColor = template[slot].pickedRColor
				bodypart.pickedGColor = template[slot].pickedGColor
				bodypart.pickedBColor = template[slot].pickedBColor

				datapack.characters[characterID].bodyparts[slot] = bodypart

		datapack.saveToDisk() 

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
