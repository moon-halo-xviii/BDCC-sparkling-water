#QuickStart Intro v0.1; skip the introductory scenes and go straight to the cellblock after character creation

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
		

	if(state == "donecreating"):
		if(GM.pc.hasPerk(Perk.StartMaleChastity) && GM.pc.hasPenis()):
			state = "chastitySelect"
		else:
			state = "crimeSelect"

	if(state == "chastitySelect"):
		saynn("Pick your chastity belt type:")
		addButton("Normal","The more comfortable one","regular_one")
		addButton("Flat","The more punishing one","flat_one")

	if(state in ["regular_one","flat_one"]):
		playAnimation(StageScene.Solo,"stand")
		saynn("Is this alright?")
		addButton("Confirm","Looks good","crimeSelect")
		addButton("Go back","Let me try the other one","chastitySelect")

	if(state == "crimeSelect"):
		saynn("What crime are you guilty of?")

		addButton("Innocent", "You were framed (general block inmate)", "crime_innocent")
		addButton("Thief", "You stole a large sum of money (general block inmate)", "crime_theft")
		addButton("Murderer", "You killed someone (high security inmate)", "crime_murder")
		addButton("Prostitute", "You were an unlicensed prostitute (sexual deviant inmate)", "crime_prostitution")

	if(state in ["crime_innocent", "crime_theft", "crime_murder", "crime_prostitution"]):
		GM.pc.getInventory().equipItem(GlobalRegistry.createItem("inmatecollar"))

		state = "done"

	if(state == "done"):
		var uniform = GlobalRegistry.createItem("inmateuniform")
		
		uniform.setPrisonerNumber(GM.pc.getFullInmateNumber())
		uniform.setInmateType(GM.pc.getInmateType())
		GM.pc.getInventory().forceEquipRemoveOther(uniform)

		GM.pc.updateAppearance()
		saynn("You're done!")
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
		setState("donecreating")

func getDevCommentary():
	return "Heya, today is the 16th of May, 2023, the day that I (Rahi) added support for developer commentary ^^\n\nThis might be the first one you read.. or not.. depends on if you started a new game after turning that option on. But I will try to make these readable out of order so no worries ^^.\n\nWhy did I add this? Isn't this a waste of my time? Isn't this a waste of your time? I dunno, I just felt like adding this.. I like to ramble sometimes and, since my game brings up lots of topics, dark or not, there is a lot to talk about ^^\n\nWill this waste my time and keep you from getting more content? Ideally it shouldn't. Here is a spoiler for you, I only work on my game for a few hours a day x3, usually about 3-4 hours. So like, finishing the work day and then just spilling my thoughts out into the commentary of some scene could be a nice way to.. stay balanced.. I dunno.\n\nI just wanna.. explain some of my choices in these, you know? So expect spoilers in these, lots of them x3\n\nBut yeah. Fun fact, this whole scene was actually rewritten just before I posted the first public version. It was worse before, trust me x3.\n\nI watched a lot of JCS - Criminal Psychology videos on youtube back then and I kinda wanted the game to start with you getting interrogated by seemingly a kind/understanding cop that then suddenly turns into a 'bad cop'. I think it's a good way to introduce the players to this dark world.. get them immersed.. or something."

func hasDevCommentary():
	return true
