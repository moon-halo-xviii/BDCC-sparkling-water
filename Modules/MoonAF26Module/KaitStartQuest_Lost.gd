#March 31 2026: Fuck, I didn't realize that Kait can actually give you the offer to start her quest even if you lose to her. I like her even more now. The whole other scene was written with her as the loser though, I dunno what else to do here. Oh well.

extends SceneBase

func _init():
	sceneID = "KaitStartQuest_Lost"

func _run():
	if(state == ""):
		addCharacter("kait")
		addCharacter("announcer")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})

		saynn("You take her hand, and she lifts you up.")

		saynn("[say=kait]Good choice. I knew you'd understand.[/say]")

		saynn("Kait looks you over, making sure you're not too badly injured. You feel pretty worn out, but it's nothing serious. She pats you on the back, and the two of you start walking towards the fence.")

		saynn("[say=announcer]What's this? It looks like Kait and {pc.name} are walking out together! Who says there's no sportsmanship in a place like this? Ladies and gentlemen, give it up for the winner, Kait, and her noble opponent![/say]")

		saynn("Ans' attempts to spin the situation only elicits a handful of claps, and a couple of jeers. You hop over the fence, and head towards the exit.")

		saynn("[say=kait]Follow me, I'll take you to my cell. We can talk in private there.[/say]")

		addButton("Continue", "See what happens next", "go_to_cell")

func _react(_action: String, _args):
	if(_action == "go_to_cell"):
		setModuleFlag("MoonAF26", "fcGroperReaction", "lost")
		GM.pc.setLocation("cellblock_lilac_nearcell")
		aimCamera("cellblock_lilac_nearcell")
		setLocationName("Kait's Cell")
		runScene("KaitCellScene", ["firstVisit"])
		endScene()
		return
	setState(_action)
