extends SceneBase

var isHighSec
var reputation:Reputation

var inmatesLevel
var inmatesStat:RepStatBase
var inmatesName

var alphaLevel
var alphaStat:RepStatBase
var alphaName

func _init():
	sceneID = "KaitStartQuest_Won"

func _initScene(_args = []):
	isHighSec = GM.pc.getInmateType() == InmateType.HighSec
	reputation = GM.pc.getReputation()

	inmatesLevel = reputation.getRepLevel(RepStat.Inmates)
	inmatesStat = GlobalRegistry.getRepStat(RepStat.Inmates)
	inmatesName = inmatesStat.getTextForLevel(inmatesLevel, reputation)

	alphaLevel = reputation.getRepLevel(RepStat.Alpha)
	alphaStat = GlobalRegistry.getRepStat(RepStat.Alpha)
	alphaName = alphaStat.getTextForLevel(alphaLevel, reputation)

func _run():
	if(state == ""):
		addCharacter("kait")
		addCharacter("inmateMale")

		saynn("You have to admit, Kait isn't your average lilac. Even if she isn't the fight club champion, she's still one of the strongest and most capable combatants you've come across. And while most people with her talents seem like they're content with sticking around and carving out a little slice of heaven in this hellhole, could she actually be serious when she says she wants to take a stand against AlphaCorp?")

		saynn("[say=pc]You really mean that?[/say]")

		saynn("She coughs as she straightens her posture, leaning back on the fence as she looks at you. Then, she gestures around the ring with her arms.")

		saynn("[say=kait]This shit? This is just divide and conquer. Trick us into fighting each other, humiliating one another, making us think that we've gotta take someone else's dignity if we wanna have any. Meanwhile, they take whatever they want, and that's just the way it is. They throw us into this fuck factory, and we... They're collectively raping all of us![/say]")

		saynn("[say=inmateMale]Speak for yourself, slut![/say]")

		saynn("Kait flinches at the guy's jab, as if it were yet another blow she'd taken in the ring, as the crowd laughs and jeers. Sensing her vulnerability, the mob stirs, eager to watch the snow leopard get what she deserves. She takes the deepest breath she can manage, eyes narrowing as they stare you down solemnly.")

		saynn("[say=kait]See what I mean? Half of the people here have already forgotten what it's like to live outside of BDCC. Some of them even enjoy it more than the lives they used to have. They don't understand what's being taken from them, or they just don't care. But you're different, aren't you? If you were the average meathead, you'd have probably already gotten started with...[/say]")

		saynn("She grimaces.")

		saynn("[say=kait]... Whatever you would've done to me by now.[/say]")

		saynn("Her eyes wander evasively. The crowd doesn't seem to notice. In the air, you can feel the tension rise as the specators grow more impatient by the second.")
		
		saynn("[say=inmateMale]Fuck, if {pc.he} doesn't want a piece of her, I'll take some.[/say]")

		saynn("An inmate shoves his way into the front row, just behind Kait. Reaching through a gap in the fence, his outstretched palms close in on her breasts...")

		addButton("Claim Her", "Tell the handsy audience member to get his hands off your prize", "claim")

		if(inmatesLevel >= 3):
			var tag = "[] "
			tag = tag.insert(1,inmatesName)
			addButton("Reason With Him", tag+"Ask the crowd to give you another minute of their time", "reason")
		else:
			addDisabledButton("Reason With Him", "Yeah, like that'll work [i][Need higher Inmate reputation][/i]")

		if(isHighSec || alphaLevel >= 3):
			var tag = "[] "

			if isHighSec:
				tag = tag.insert(1, InmateType.names[InmateType.HighSec].to_upper())
			else:
				tag = tag.insert(1,alphaName)

			addButton("Threaten Him", tag+"Tell the handsy audience member to piss off", "threaten")
		else:
			addDisabledButton("Threaten Him", "You don't have enough aura to pull this off [i][Need higher Alpha reputation][/i]")
		addButton("Allow Him", "Let the audience member have his fun", "groping")

	if(state == "claim"):
		saynn("You nod in the audience member's direction, scowling. He freezes in place.")

		saynn("[say=pc]Watch it, buddy. The girl's mine, fair and square. You want a piece of her? Come in here and take her from me.[/say]")

		saynn("The crowd murmurs in excitement at your challenge, now things are getting interesting! Heads start turning towards the groper, anxious to see his response. He buckles quickly, slowly pulling his hands away as he crosses his arms.")

		saynn("[say=inmateMale]Whatever. Fucking killjoy.[/say]")

		saynn("You see Kait gulp, eyes facing the floor as she scoots herself away from the fence, towards you. It's hard to tell, but... Is she blushing?")


	if(state == "reason"):
		saynn("[say=pc]Hold on a minute, pal.[/say] You gently hold out your open hand towards him, taking a step in his direction. He looks at you, more confused than anything else, but he's listening. His open palms hover in the air as if a security guard had ordered him to freeze. Raising your head, you begin to address the crowd:")

		saynn("[say=pc]I know this isn't what most of you were hoping for, but don't any of you still dream about getting out of here one day? Let's hear her out. Just another minute of your time, and then we'll be on our way.[/say]")

		saynn("The audience appears to deliberate with itself: you faintly make out a few disappointed groans, some incredulous chatter, and more agreeable murmurs of discussion and nodding heads than you expected. Behind Kait, the one inmate pulls his hands out of the fence, sheepishly shoving them into his pockets. It seems they're giving you a chance. Kait herself looks genuinely impressed by the way you've managed to pacify the crowd.")

	if(state == "threaten"):
		saynn("You raise your finger and outstretch your arm towards the audience member with the force of a punch. The room goes silent. Even Kait gets startled.")

		saynn("[say=pc]Lay so much as a finger on her, and so help me, I will shove my {pc.foot} so far up your ass, you'll choke on it.[/say]")

		saynn("His hands quickly retract from the fence, and he waddles his way back into the crowd. You turn back to Kait.")

	if(state == "groping"): #part 1
		saynn("You pay the audience no mind as the man palms each of Kait's breasts, kneading them like dough. She shifts around in discomfort, trying to escape his grasp, but she's too exhausted to put up a real fight. He pulls her back towards him in retaliation, squeezing her tits hard, causing her to wince and whimper in pain. Then, she glares at you.")

		saynn("[say=kait]A little help here, maybe?[/say]")

		saynn("You shrug.")

	if(state in ["claim", "reason", "threaten", "groping"]):
		saynn("[say=pc]You were saying?[/say]")

		saynn("[say=kait]I... I don't even know what else to add. I didn't come here with a whole stupid speech prepared.[/say]")

		saynn("She rolls her eyes.")

		if(GM.pc.getInmateType() == InmateType.SexDeviant):
			saynn("[say=kait]Look, you and I, we're not so different, right? Both of us managed to get this far in the arena, against all odds, against what everyone expected from us. And still, at the end of the day, everyone still just thinks of us as fuckmeat. Nobody listens to us because we're lilacs."+(".. Well, maybe people listen to [b]you[/b], but whatever. If " if (state in ["reason", "threaten"]) else " But if ")+"we work together, we might just have a fighting chance.[/say]")
		else:
			saynn("[say=kait]Listen, we both got this far in the arena, didn't we? The whole damn reason I signed up was to find someone else who has what it takes to fight the [b]real[/b] battle. Because no matter how strong we might be on our own, it'll never be enough to take on the people in charge. But if we work together, we might just have a fighting chance.[/say]")

	if(state in ["claim", "reason", "threaten"]):
		if(getModuleFlag("TaviModule", "ch3StartedInfiltration", true)):
			saynn("[say=pc]You're not wrong. But you've tried this before and it didn't work out, right? What makes you think this'll be any different?[/say]")

			saynn("The cat sighs.")

			saynn("[say=kait]Well, for one, you're actually [b]listening[/b] to me. Tavi would've either tuned me out or made me start eating her out by now.[/say]")

			saynn("[say=pc]You're not wrong there, either... But if not her, would it really just be us two right now?[/say]")

		else:
			saynn("[say=pc]You're not wrong. But from the way you're talking, it doesn't sound like you've got many other friends in here. Is it just us two right now?[/say]")
		
		saynn("[say=kait]I have leads on some other promising candidates. We can follow up on them together. Let's get outta here, and I can get you up to speed.[/say]")

		saynn("She's right, you probably don't want to have this conversation with dozens of unscrupulous inmates watching. Plus, both of you have long outstayed your welcome here. Now the only thing left is for Kait to get up off the floor...")

		addButton("Help her up", "Give her a hand and help her get on her paws", "help_up")
		addButton("Wait for her", "She's had a minute to catch her breath, let her take care of herself", "wait")

	if(state == "groping"): #part 2
		saynn("Meanwhile, the man groping Kait slides his hands under her shirt, his fingers running through the white fur on her {kait.breastsSize} breasts, before rolling the fabric up to expose her bare chest. Kait does her best to ignore it while she talks to you, but she's clearly uncomfortable. It doesn't take him long to move his right hand down to her waist and into her shorts, giving her pussy a firm massage. She squirms and struggles with every stroke, but her protests are futile.")

		saynn("[say=kait]Holy shit, can't you see we're trying to have a conversation here, prick?![/say]")

		saynn("[say=inmateMale]Sounds to me like you're just talking to yourself, bitch. Heh, I think "+("{pc.name}" if inmatesLevel >= 2 else "the "+GM.pc.getSpecies()[0])+" over there just wants us to give {pc.him} a show while you make yourself look stupid. Dumb fucking slut, running her mouth because it don't got a cock stuffed into it like it oughta...[/say]")

		saynn("He looks around the room. Other people seem keen on getting their hands on Kait, too; he doesn't seem to mind one bit.")

		saynn("[say=inmateMale]Hey, does anyone got one of those dildo-gag thingies? A regular one would work, too.[/say]")

		saynn("Kait snarls, trying to put on a brave face, but you can tell she's scared as her eyes widen and her breathing quickens. Just like she said, she's strong, but she can only bear so much on her own. You better take her up on her offer now, before she changes her mind.")

		addButton("Intervene", "Get the crowd off her back. And the rest of her body, while you're at it", "intervene")
	
	if(state == "intervene"):
		saynn("[say=pc]Okay, fun time's over. Let the kitty go.[/say]")

		saynn("Mr. Handsy gives you a dirty look.")

		saynn("[say=inmateMale]What, now you decide you want her for yourself? Too late, buddy. Thanks for the free toy, now get the fuck outta here.[/say]")

		if(inmatesLevel >= 2 || alphaLevel >= 3):
			saynn("[say=pc]The fuck did you just say to me?[/say]")

			saynn("You expect that yelling and puffing your chest would be enough to scare him off, given your reputation, but he stands there unfazed. Apparently, once he's got his mitts on something, it's not so easy to get him to let go. The rest of the crowd watches in anticipation...")

			saynn("[say=inmateMale]I expected more from the great {pc.name}. I was hoping you'd put on a real show for us, put this whore back in her place. And you let her give a fuckin' speech? You stand there, waste our time, and watch as other people take your bitches from you? What kind of a goddamn cuck are you?[/say]")

		else:
			saynn("Apparently, once he's got his mitts on something, it's not so easy to get him to let go.")

			saynn("[say=pc]Hey, it's still my turn in the ring. The winner gets to do anything they want, remember? Well, now I want you to stop.[/say]")

			saynn("[say=inmateMale]As far as I'm concerned, you forfeited her. Ya snooze, ya lose, moron.[/say]")
		
		saynn("He pulls his right hand out of Kait's pants and points an accusatory finger at you, his other hand still resting on Kait's breast. Suddenly, Kait bites his left hand! He howls in pain as she quickly pulls away from him, crawling away from the fence as fast as she can manage. She pulls down her shirt and turns around to face him, watching him nurse his bleeding hand. She wipes her lips with the back of her palm and sports a wicked grin, baring crimson-red fangs.")

		saynn("[say=inmateMale]Shit, shit shit! That psycho bit my fucking hand! It's fucking bleeding![/say]")

		saynn("[say=kait]Next time I see you, you'll be bleeding from more than just your hand.[/say]")

		saynn("It looks like she's gotten some of her strength back, and not too soon. Both of you have long outstayed your welcome here. Now the only thing left is for Kait to get up off the floor...")

		addButton("Help her up", "Give her a hand and help her get on her paws", "help_up")
		addButton("Wait for her", "She's had a minute to catch her breath, let her take care of herself", "wait")
	
	if(state == "help_up"):
		saynn("You bow slightly and offer your hand to her. She grabs it, and you pull her up, though it feels like she's doing most of the work herself. It looks like she won't have any problems walking.")
	
	if(state == "wait"):
		saynn("You stand by as you wait for Kait to get up. She slowly pushes herself off the ground. She's clearly exhausted, but it looks like she won't have problems walking.")

	if(state in ["help_up", "wait"]):
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		addCharacter("announcer")
		saynn("[say=pc]Ready to get out of here?[/say]")

		if(getModuleFlag("MoonAF26", "fcGroperReaction", "") != "groping"):
			saynn("[say=kait]Yeah, we better leave before these guys decide to rush us and throw us in the stocks.[/say]")
		else:
			saynn("[say=kait]Were you really just gonna watch me get hand-fucked?[/say]")

			saynn("[say=pc]You took care of yourself, didn't you?[/say]")

			saynn("She grimaces, and for a split second, you think she's going to bite you next. But she just licks some of the blood off of her teeth, and sighs.")

		saynn("You and Kait hop over the fence, heading for the exit. You catch a couple of dirty looks from audience members. From the balcony, you hear the Announcer doing his thing:")

		saynn("[say=announcer]Give it up for {pc.name} and Kait, folks! This fight was a little unorthodox, but part of the fun is never knowing what happens next. Avy and I have already gotten a new match lined up, so don't go anywhere, we're just getting started![/say]")

		saynn("Hopefully, that'll keep them distracted...")

		if(getModuleFlag("MoonAF26", "kaitFondness", 0) >= 3):
			saynn("[say=kait]Wanna take me to your cell? We can talk in private there.[/say]")
			
			addButton("Your Cell", "Bring Kait to your cell", "go_to_player")
			addButton("Her Cell", "Ask if you can visit her cell instead", "ask2visit")
		else:
			saynn("[say=kait]Follow me, I'll take you to my cell. We can talk in private there.[/say]")
			
			addButton("Follow", "Follow Kait to her cell", "go_to_kait")
			addButton("Your Cell", "Ask her to come to your cell instead", "ask4visit")

	if(state == "ask2visit"):
		saynn("[say=pc]What if we go to your place instead?[/say]")

		saynn("She looks a little surprised that you asked, but she shrugs in agreement.")

		saynn("[say=kait]Sure, whatever you want.[/say]")

		addButton("Continue", "See what happens next", "go_to_kait")

	if(state == "ask4visit"):
		saynn("[say=pc]How about you come over to my place instead?[/say]")

		var fondness = getModuleFlag("MoonAF26", "kaitFondness")
		
		if fondness <= -10 || getModuleFlag("MoonAF26", "fcKaitWasBeatenUp", false):
			processTime(30)

			saynn("Suddenly, she grabs your shoulder, and you feel her claws digging into your skin. The pain is paralyzing.")

			saynn("[say=kait]I'm only going to say this once: we're not friends. You're strong, you're capable, and I wouldn't have given you this opportunity if I didn't think you could be useful. But I do not like you. I do not want to be with you for a second longer than I have to. And I do [b]not[/b] want to be another romantic sidequest for you to play through until the next one comes along.[/say]") #Kait can have a little 4th wall break, as a treat

			if getModuleFlag("MoonAF26", "fcKaitWasRaped", false):
				increaseModuleFlag("MoonAF26", "kaitFondness", -5)

				saynn("Her claws go deeper, drawing blood. Your legs buckle.")

				saynn("[say=kait][b]Especially[/b] not after what you did to me. If you so much as [b]touch[/b] me again, or look at me in a way I don't like, you can kiss my offer goodbye.[/say]")

				saynn("Finally, she lets you go, and you feel like you can move again.")

			elif getModuleFlag("MoonAF26", "fcKaitWasBeatenUp", false):
				increaseModuleFlag("MoonAF26", "kaitFondness", -2)
				saynn("She lets you go, and you feel like you can move again.")

				saynn("[say=kait]Do you have any idea how long I was in the cryopod after you beat the shit out of me? You didn't have to go that far. I wouldn't have.[/say]")
			
			saynn("That sounds like a \"no\" to you...")

			addButton("Continue", "What were you expecting?", "go_to_kait")
		elif fondness <= 0:
			saynn("[say=kait]Nice try, but I'm not interested. I'm only bringing you to mine because I don't want anyone listening to us. Let's keep this professional, okay?[/say]")

			saynn("Well, couldn't hurt to ask.")

			addButton("Continue", "Maybe try to get on her good side first?", "go_to_kait")

		else:
			saynn("Kait doesn't answer you right away, but the both of you keep walking to the cellblock. She looks uncertain... Worried?... Embarrassed?...")

			saynn("[say=pc]It's fine if you don't want to. Just thought I'd ask.[/say]")

			saynn("[say=kait]No, it's alright. We can go to your cell. They're all the same anyway, right?[/say]")

			saynn("Seems like she's not opposed to the idea.")

			addButton("Continue", "Bring your new friend over", "go_to_player")


func _react(_action: String, _args):
	if(_action in ["claim", "threaten", "reason", "groping"]):
		processTime(90)
		setModuleFlag("MoonAF26", "fcGroperReaction", _action)

	match _action:
		"claim":
			increaseModuleFlag("MoonAF26", "kaitFondness", 2)
		"threaten":
			increaseModuleFlag("MoonAF26", "kaitFondness", 1)
		"reason":
			increaseModuleFlag("MoonAF26", "kaitFondness", 3)
		"groping":
			increaseModuleFlag("MoonAF26", "kaitFondness", -2)
		
	if(_action == "help_up"):
		increaseModuleFlag("MoonAF26", "kaitFondness", 1)

	if(_action == "go_to_kait"):
		processTime(90)
		GM.pc.setLocation("cellblock_lilac_nearcell")
		aimCamera("cellblock_lilac_nearcell")
		setLocationName("Kait's Cell")
		runScene("KaitCellScene", ["firstVisit"])
		endScene()
		return
	
	if(_action == "go_to_player"):
		processTime(100)
		GM.pc.setLocation(GM.pc.getCellLocation())
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		runScene("KaitQuestBriefing", ["kaitVisitingPlayer"])
		endScene()
		return
	
	setState(_action)