extends SceneBase
func _init():
	sceneID = "KaitCellScene"

func _initScene(_args = []):
	addCharacter("kait")
	playAnimation(StageScene.Duo, "walk", {npc="kait", npcAction = "walk", flipNPC = true})
	setModuleFlag("MoonAF26", "kaitCellVisited", true)

	if "firstVisit" in _args:
		if getModuleFlag("MoonAF26", "kaitFondness", 0) > 0:
			increaseModuleFlag("MoonAF26", "kaitFondness", 1)
		state = "intro"

func _run():
	var kaitFondness = getModuleFlag("MoonAF26", "kaitFondness", 0)
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("You walk into Kait's cell. As always, it's very tidy. Conveniently, Kait is around whenever you come to visit her.")

	if(state == "inspect"):
		saynn("There's not too much to look at around here, the room is exceptionally bare, even for a prison cell. That said, maybe she's got stuff hidden under her bed.")

		saynn("Sure enough, there's a small stash beneath the bedframe. A couple of sex toys, a pack of condoms, some birth control pills, a makeshift knife, and a couple of apples. There's not really any trash down here, barely even dirt or dust.")
		
		saynn("[say=kait]Uh... What are you doing?[/say]")

		saynn("[say=pc]Huh? What?[/say]")

		saynn("[say=kait]Why are you looking under my bed?[/say]")

		saynn("You are, in fact, squatting right by the edge of the bed, with your head sticking into space beneath.")

		saynn("[say=pc]I just felt like looking around.[/say]")

		saynn("[say=kait]Under my bed?! I have stuff down there![/say]")

		saynn("[say=pc]Yeah, I figured, and I was curious what it was.[/say]")

		saynn("[say=kait][b]WHY?![/b][/say]")

		saynn("She raises an excellent point.")

		saynn("[say=pc]Why not?[/say]")

		saynn("She starts to form another retort, but at this point, she gives up.")

		if kaitFondness >= 3:
			saynn("[say=kait]Well, as you've already seen, I've got some personal stuff down there. Nothing unusual, I guess, but still.[/say]")

			saynn("[say=pc]Yeah, that makes sense. But what's a girl like you doing with a box of condoms under her bed?[/say]")

			if(GM.pc.hasReachablePenis()):			
				saynn("She smirks.")

				saynn("[say=kait]So that you never have an excuse to not wear one with me~[/say]")
				
				saynn("Is that how it is?...")

				saynn("[say=pc]Not a fan of getting bred?[/say]")

				saynn("She squirms.")

				saynn("[say=kait]God, no. I don't want my children being raised by these monsters. But I just don't really like it when sex gets too messy. I especially hate having to wash it out of my fur.[/say]")
				
				saynn("Fair enough.")

			else:
				saynn("[say=kait]They're nice to have, just in case.[/say]")

				saynn("[say=pc]Not a fan of getting bred?[/say]")

				saynn("She squirms.")

				saynn("[say=kait]God, no. I don't want my children being raised by these monsters. But I just don't really like it when sex gets too messy. I hate having to wash it out of my fur.[/say]")

				saynn("She smirks.")

				saynn("[say=kait]Of course, I don't have to worry about that with you~.[/say]")
				
				saynn("Is that how it is?...")


		else:
			saynn("[say=kait]If you steal anything from me, I'll make you regret it.[/say]")

			saynn("Seems she's not too happy about you snooping around...")

	if(state == "stool"):
		saynn("[say=pc]Don't most of these cells have stools in them? Why don't you have one?[/say]")

		saynn("She swallows.")

		saynn("[say=kait]Well, I [b]used[/b] to have one. And then I broke it.[/say]")

		saynn("[say=pc]How?! I know your legs are pretty strong, but that seems ridiculous.[/say]")

		if kaitFondness >= 1:
			saynn("She chuckles.")

			saynn("[say=kait]No, I didn't break it by sitting on it, silly.[/say]")
		else:
			saynn("Her expression remains stone-cold.")

			saynn("[say=kait]That's not how it happened.[/say]")
		
		saynn("She sighs wistfully. Her gaze wanders to the corner of the room.")

		saynn("[say=kait]A long while back... Not long after I was first brought here, actually... Someone came in here. Another inmate, one of the reds. You know how it is with lilacs. I was sleeping, and they caught me off guard.[/say]")

		saynn("Raising her head, she narrows her eyes and grins proudly.")

		saynn("[say=kait]But they underestimated me. I ended up breaking it over their head, and then some. Since then, most people know to think twice before trying to fuck with me. Well, the people that heard about that, at least. Anyway, after the nurses dragged them away, the guards picked up the broken pieces, and I never got a new one.[/say]")

	if(state in ["", "inspect", "stool"]):
		if not getModuleFlag("MoonAF26", "gotBriefed", false):
			addButton("Briefing", "Ask about Kait's escape plan", "briefing")

		addDisabledButton("About Her", "Ask her about herself [Not done yet, I don't even know if Rahi has a backstory for her]")
		addButton("Look Around", "Take a look around the place", "inspect")
		if kaitFondness >= 3:
			addDisabledButton("Sex", "Ask if she's in the mood for sex [Not done yet, ironically]")
		else:
			if kaitFondness <= -20:
				addDisabledButton("Sex?", "You're delusional")
			elif kaitFondness <= -10:
				addDisabledButton("Sex?", "She's REALLY not interested in you")
			else:
				addDisabledButton("Sex?", "She's not interested in you")
		addButton("No stool?", "Ask why her cell doesn't have a stool", "stool")

		addButton("Leave", "Get out of her cell", "endthescene")

	if(state == "intro"):
		say("You walk into Kait's cell in the lilac cell block.")
		if(GM.pc.getInmateType() == InmateType.SexDeviant):
			say(" Not too far from your own, actually.")
		saynn(" It looks rather well-kept, but furnished with nothing but a cheap bed, like most of the other cells here. Come to think of it, she doesn't even have a stool. She sits down on the mattress while you linger in the doorway.")

		saynn("[say=kait]"+("Come on in. " if(getModuleFlag("MoonAF26", "kaitFondness", 0) >= 0) else "")+"I'd offer you a place to sit, but the stool... Isn't here anymore.[/say]")

		addButton("Continue", "See what happens next", "")
		addButton("Ask for Bed", "Ask to sit on the bed with her", "ask_bed")

	if(state == "ask_bed"):
		saynn("[say=pc]It looks like there's enough space on that bed for two.[/say]")
		if kaitFondness >= 3:
			saynn("[say=kait]I, uh... Sure![/say]")

			saynn("She scoots over and pats the mattress, inviting you over. You sit beside her.")

		elif kaitFondness > 0:
			saynn("[say=kait]Hey, no offense, but I'm not really interested in that right now.[/say]")

			saynn("[say=pc]Who said anything about [b]that[/b]?[/say]")
			
			saynn("She rubs her eyebrows.")

			saynn("[say=kait]Fine. But don't get any ideas. This is a strictly professional relationship, okay?[/say]")

			saynn("She reluctantly makes space for you: plenty, in fact, to keep some distance between the two of you. You sit down on the opposite end of the bed.")

		else:
			saynn("[say=kait]No, there isn't.[/say]")

			saynn("It looks like you'll have to stand.")
		
		addButton("Continue", "See what happens next", "")


func _react(_action: String, _args):
	if(_action == "intro"):
		processTime(10)
	if(_action == "ask_bed"):
		processTime(10)
		var kaitFondness = getModuleFlag("MoonAF26", "kaitFondness", 0)
		if kaitFondness >= 3:
			increaseModuleFlag("MoonAF26", "kaitFondness", 1)
		elif kaitFondness <= 0:
			increaseModuleFlag("MoonAF26", "kaitFondness", -1)

	if(_action == "briefing"):
		runScene("KaitQuestBriefing")
		endScene()
		return

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)