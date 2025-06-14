#QuickStart Intro v1.0; skip the introductory scenes and go straight to the cellblock after character creation. Tested up to BDCC v0.1.8; should also work on older 0.1 versions, tested down to v0.1.1.
#As a bonus, you're given the option to set your encounter preferences before the first batch of NPC pawns generate. No need to prune unwanted character types from your list after the fact!
#FYI: You miss out on 20-50 XP you can earn by fighting Risha in the opening. This mod assumes you chose not to fight her during intake; if you were trying to start the game as quickly as possible, you probably would have done that anyway. 

extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "IntroScene"

func _run():
	if(state == ""):
		aimCamera("intro_corridor")
		setLocationName("IBS \"Integrity\"")
		playAnimation(StageScene.Solo, "stand")
		say("Enter the name of your character:")
		
		var textBox:LineEdit = addTextbox("player_name")
		var _ok = textBox.connect("text_entered", self, "onTextBoxEnterPressed")
		
		addButton("Confirm", "Choose this name", "setname")
		

	if(state == "chastityCheck"):
		if(GM.pc.hasPerk(Perk.StartMaleChastity) && GM.pc.hasPenis()):
			setState("chastitySelect")
		else:
			setState("crimeSelect")

	if(state == "chastitySelect"):
		saynn("Pick your chastity belt type:")
		addButton("Normal","The more comfortable one","regular_one")
		addButton("Flat","The more punishing one","flat_one")

	#Since there's only two cage options right now, it's better to let the user toggle between them here. If more cages are added in the future, return the user to chastitySelect instead.
	if(state in ["regular_one","flat_one","chastitySwap"]):
		playAnimation(StageScene.Solo,"stand")
		saynn("Is this alright?")
		addButton("Confirm","Looks good","crimeSelect")
		addButton("Try the other","Let me try the other one","chastitySwap")

	if(state == "crimeSelect"):
		saynn("What crime are you guilty of?")

		addButton("Innocent", "You were framed (start as general block inmate)", "crime_innocent")
		addButton("Thief", "You stole a large sum of money (start as general block inmate)", "crime_theft")
		addButton("Murderer", "You killed someone (start as high security inmate)", "crime_murder")
		addButton("Prostitute", "You were an unlicensed prostitute (start as sexual deviant inmate)", "crime_prostitution")

	if(state in ["crime_innocent", "crime_theft", "crime_murder", "crime_prostitution"]):
		GM.pc.getInventory().equipItem(GlobalRegistry.createItem("inmatecollar"))

		setState("promptPreferences")

	if(state in "promptPreferences"):
		saynn("Almost done! Do you want to adjust your character's preferences? You can change these later at any time.")
		addButton("Yes","Adjust my preferences","changePreferences")
		addButton("No","Do this later","done")

	if(state == "done"):
		var uniform = GlobalRegistry.createItem("inmateuniform")
		
		uniform.setPrisonerNumber(GM.pc.getFullInmateNumber())
		uniform.setInmateType(GM.pc.getInmateType())
		GM.pc.getInventory().forceEquipRemoveOther(uniform)

		GM.pc.updateAppearance()
		saynn("You're done! Now get out there and cause some trouble!")
		addButton("Continue","Start playing","endthisscene")

		

func onTextBoxEnterPressed(_new_text:String):
	GM.main.pickOption("setname", [])

func _react(_action: String, _args):
	if(_action == "setname"):
		if(getTextboxData("player_name") == ""):
			return
		
		GM.pc.setName(getTextboxData("player_name"))
		
		#setState("pickgender")
		runScene("CharacterCreatorScene", [], "character_creator")
		return
	
	if(_action == "endthisscene"):
		GM.main.setFlag("Game_CompletedPrologue", true)
		startNewDay()
		GM.pc.afterSleepingInBed()
		runScene("WorldScene")
		endScene()
	
	#"crime_innocent", "crime_theft", "crime_murder", "crime_prostitution"
	
	if(_action == "crime_innocent"):
		setFlag("Player_Crime_Type", Flag.Crime_Type.Innocent)
		GM.pc.setInmateType(InmateType.General)
	if(_action == "crime_theft"):
		setFlag("Player_Crime_Type", Flag.Crime_Type.Theft)
		GM.pc.setInmateType(InmateType.General)
	if(_action == "crime_murder"):
		setFlag("Player_Crime_Type", Flag.Crime_Type.Murder)
		GM.pc.setInmateType(InmateType.HighSec)
	if(_action == "crime_prostitution"):
		setFlag("Player_Crime_Type", Flag.Crime_Type.Prostitution)
		GM.pc.setInmateType(InmateType.SexDeviant)
	
	if(_action == "regular_one"):
		setFlag("MedicalModule.PC_ReceivedPermanentCage", true)
		setFlag("MedicalModule.PC_PickedFlatPermanentCage", false)
		
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ChastityCagePermanentNormal"))
		
	if(_action == "flat_one"):
		setFlag("MedicalModule.PC_ReceivedPermanentCage", true)
		setFlag("MedicalModule.PC_PickedFlatPermanentCage", true)
		
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ChastityCagePermanent"))

	if(_action == "chastitySwap"):
		if(getFlag("MedicalModule.PC_PickedFlatPermanentCage")):
			setFlag("MedicalModule.PC_PickedFlatPermanentCage", false)	
			GM.pc.getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("ChastityCagePermanentNormal"))
		else:
			setFlag("MedicalModule.PC_PickedFlatPermanentCage", true)
			GM.pc.getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("ChastityCagePermanent"))

	if(_action == "changePreferences"):
		runScene("EncountersMenuScene", [], "encounters_menu")

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "character_creator"):
		setFlag("Game_PickedStartingPerks", true)
		if(!getFlag("PickedSkinAtLeastOnce")):
			runScene("ChangeSkinScene", [], "the_skin")
		else:
			runScene("PickStartingPerksScene", [], "starting_perks")
	if(_tag == "the_skin"):
		runScene("PickStartingPerksScene", [], "starting_perks")
	if(_tag == "starting_perks"):
		setState("chastityCheck")
	if(_tag == "encounters_menu"):
		setState("done")

func getDevCommentary():
	return "Heya, today is the 16th of May, 2023, the day that I (Rahi) added support for developer commentary ^^\n\nThis might be the first one you read.. or not.. depends on if you started a new game after turning that option on. But I will try to make these readable out of order so no worries ^^.\n\nWhy did I add this? Isn't this a waste of my time? Isn't this a waste of your time? I dunno, I just felt like adding this.. I like to ramble sometimes and, since my game brings up lots of topics, dark or not, there is a lot to talk about ^^\n\nWill this waste my time and keep you from getting more content? Ideally it shouldn't. Here is a spoiler for you, I only work on my game for a few hours a day x3, usually about 3-4 hours. So like, finishing the work day and then just spilling my thoughts out into the commentary of some scene could be a nice way to.. stay balanced.. I dunno.\n\nI just wanna.. explain some of my choices in these, you know? So expect spoilers in these, lots of them x3\n\nBut yeah. Fun fact, this whole scene was actually rewritten just before I posted the first public version. It was worse before, trust me x3.\n\nI watched a lot of JCS - Criminal Psychology videos on youtube back then and I kinda wanted the game to start with you getting interrogated by seemingly a kind/understanding cop that then suddenly turns into a 'bad cop'. I think it's a good way to introduce the players to this dark world.. get them immersed.. or something."

func hasDevCommentary():
	return true
