extends SceneBase

func _init():
	sceneID = "Eliza0AskJobScene"
	
var grade = 0
var answer = "Mayonnaise"
var cheater = false

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You quickly skim through the paper. One of the options sounds intriguing.. Lab Assistant.. it's written with a pen rather than printed.")

		saynn("[say=pc]Lab assistant? What's that about?[/say]")

		saynn("Quinn looks at the paper herself.")

		saynn("[say=eliza]Oh, yeah. I forgot about that one. No one usually asks.[/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("The feline shrugs and blinks cutely, the corners of her mouth raising in a slightly creepy way.")

		saynn("[say=eliza]I have no idea~.[/say]")

		saynn("Her eyes are sparking while she stares at you.")

		saynn("[say=eliza]You love science, huh~? Isn't it great, making breakthroughs, unlocking hidden knowledge, creating prototypes, testing your freshly-made drugs on unsuspecting test subjects.. mmm~..[/say]")

		saynn("She seems to be drifting off somewhere else, her gaze wandering around the lobby..")

		saynn("[say=pc]What is the job about, lady?[/say]")

		saynn("She snaps out of it and frowns.")

		saynn("[say=eliza]I'm doctor Quinn, not just a lady.[/say]")

		saynn("[say=pc]Sure. I just wanted the job details.[/say]")

		saynn("Doctor Quinn hums and rubs her chin.")

		saynn("[say=eliza]This position is exactly what it sounds like. I need a lab assistant. Someone that can help me in the lab.[/say]")

		saynn("[say=pc]What kind of help do you need?[/say]")

		saynn("Huh. Would she really allow any inmate inside the lab?")

		saynn("[say=eliza]I'm a chemist. I'm researching new types of drugs, medical or.. mostly medical of course. But I've been lacking enough time to do proper research lately. Since, I need an assistant.[/say]")

		saynn("Researching drugs.. Could be interesting.")

		saynn("[say=pc]Let's say.. I want to try to fill that position. What do I do?[/say]")

		saynn("Doctor tilts her head slightly and puts on her serious eyes.")

		saynn("[say=eliza]Do you have experience in the chemistry field?[/say]")

		saynn("[say=pc]Depends..[/say]")

		saynn("Suddenly, the feline switches to her rapid voice...")

		saynn("[i]You sense a pop quiz coming...[/i]")

		addButton("Quiz Time!", "Let's see how qualified you are", "question1")

	if(state == "question1"):

		saynn("[say=eliza]What is the name of the highly toxic chemical compound that contains a carbon atom triple-bonded to a nitrogen atom and is often associated with certain industrial processes and the poisoning of living organisms?[/say]")

		saynn("[say=pc]Uh..[/say]")

		saynn("[say=eliza]You have one second to answer.[/say]")

		saynn("Panic settles fast.. what..")

		saynn("[say=pc]Um..[/say]")

		saynn("Hurry! What's your answer?")

		addButton("Strychnine", "Is this your final answer?", "Strychnine")
		addButton("Cyanide", "Is this your final answer?", "Cyanide")
		addButton("Carboxylic acid", "Is this your final answer?", "Carboxylic acid")
		addButton("Amyl nitrite", "Is this your final answer?", "Amyl nitrite")
		addButton("Atropine", "Is this your final answer?", "Atropine")

	if(state == "failQ1"):
		saynn("[say=pc]"+answer+"?[/say]")

		saynn("[say=eliza]Beep beep, wrong! The answer is cyanide![/say]")

		saynn("Really?")

		addButton("Next","Maybe it'll get easier from here?","question2")

	if(state == "Cyanide"):
		grade += 1

		saynn("[say=pc]Cyanide.[/say]")

		saynn("[say=eliza]Correct!"+("... Do I want to know how you know that?" if GM.pc.getInmateType() == InmateType.HighSec else "")+"[/say]")

		if(GM.pc.getInmateType() == InmateType.HighSec):
			saynn("[say=pc]Next question.[/say]")

		saynn(("Wow, you actually got the first question right! " if GM.pc.getInmateType() != InmateType.HighSec else "") + "Maybe this test won't be so hard after all.")

		addButton("Next","Maybe you can do this after all?","question2")

	if(state == "Amyl nitrite"):
		saynn("[say=pc]Amyl nitrite.[/say]")
		
		saynn("[say=eliza]Wrong!...[/say]")

		saynn("Eliza raises an eyebrow, and glances over your left shoulder at the vendomat in the corner.")

		saynn("[say=eliza]Have they started handing that out without giving me notice?[/say]")

		if(GM.pc.getInmateType() == InmateType.SexDeviant):
			saynn("[say=pc]I haven't seen any around, but I know you're supposed to be careful with them. Wouldn't surprise me if it's used in industrial stuff too, like you said.[/say]")
		else:
			saynn("[say=pc]Uh, I don't think so? Can't remember where I've heard of it before.[/say]")
		
		saynn("You can't tell if she looks relieved, or disappointed.")

		saynn("[say=eliza]Oh well, I was just curious. The answer is cyanide![/say]")

		saynn("Really?")

		addButton("Next","Maybe it'll get easier from here?","question2")

	if(state == "question2"):
		saynn("[say=eliza]What is the name of the compound with the formula NH3, commonly used as a fertilizer and in cleaning products?[/say]")

		saynn("[say=pc]Uh.. wait![/say]")

		saynn("Come on, the answer's gotta be hiding in your brain somewhere!")

		addButton("Gonadotropin", "Is this your final answer?", "Gonadotropin")
		addButton("Trinitrotoluene", "Is this your final answer?", "Trinitrotoluene")
		addButton("Nitrate", "Is this your final answer?", "Nitrate")
		addButton("Ammonia", "Is this your final answer?", "Ammonia")
		addButton("Bleach", "Is this your final answer?", "Bleach")

	if(state == "failQ2"):
		saynn("[say=pc]"+answer+"?[/say]")
		saynn("[say=eliza]Wrong! Ammonia![/say]")

		saynn("More like.. Imma need more time..")

		addButton("Next", ("You're not doing so good..." if grade == 0 else "See the next question"),"question3")

	if(state == "Gonadotropin"):
		saynn("[say=pc]Gonadotropin?[/say]")

		saynn("You heard fertilizer, and you think the heat pills they sell at the vendomat said they contain something like that.")

		saynn("[say=eliza]Wrong! Ammonia![/say]")

		saynn("More like.. Imma need more time..")

		addButton("Next", ("You're not doing so good..." if grade == 0 else "See the next question"),"question3")

	if(state == "Trinitrotoluene"):
		saynn("[say=pc]Trinitrotoluene?[/say]")

		if (GM.pc.getInmateType() == InmateType.HighSec):
			saynn("[say=eliza]Oh boy... Do I even wanna know how you know that word?[/say]")

			saynn("[say=pc]You said it was a fertilizer, and fertilizers can go boom. I guess it counts as a cleaning product too, depending on how you use it. I think I read it on a label for, uh... Something else.[/say]")

			saynn("[say=eliza]A box of TNT, perhaps?[/say]")

			saynn("[say=pc]Well, uh... Is that the same thing as NH3?[/say]")

			saynn("Eliza sighs.")

			saynn("[say=eliza]No. The answer is ammonia.[/say]")

		else:
			saynn("[say=eliza]Wrong! Ammonia. I hope you're not using TNT to clean your windows.[/say]")

		saynn("Looks like you blew it.")

		addButton("Next", ("You're not doing so good..." if grade == 0 else "See the next question"),"question3")

	if(state == "Ammonia"):
		grade += 1

		var adj = ""

		if(getFlag("Player_Crime_Type") == Flag.Crime_Type.Theft):
			adj = "thief"
		elif(getFlag("Player_Crime_Type") == Flag.Crime_Type.Murder):
			adj = "murderer"
		elif(getFlag("Player_Crime_Type") == Flag.Crime_Type.Prostitution):
			adj = "prostitute"
		else:
			adj = "regular "+GM.pc.getSpeciesFullName().to_lower()
				
		saynn("[say=pc]Ammonia.[/say]")

		saynn("[say=eliza]Correct![/say]")

		saynn("More like, \"I'm only a "+adj+", but I actually know some stuff.\"")

		addButton("Next", "See the next question", "question3")

	if(state == "question3"):
		saynn("[say=eliza]What is the name of the element with the symbol O, essential for respiration in most living organisms and a key component of water?[/say]")

		saynn("You got this...")

		addButton("Oxygen","Is this your final answer?","Oxygen")
		addButton("Hydrogen","Is this your final answer?","Hydrogen")
		addButton("Zeronium","Is this your final answer?","Zeronium")
		addButton("Osmium","Is this your final answer?","Osmium")

	if(state == "Oxygen"):
		grade += 1

		saynn("[say=pc]Oxygen![/say]")

		saynn("[say=eliza]I'd be surprised if you didn't know that.[/say]")

		saynn("[say=pc]Pfff.[/say]")

		addButton("Next", "See the next question", "question4")

	if(state == "Hydrogen"):
		saynn("[say=pc]Hydrogen![/say]")

		saynn("Eliza shakes her head.")

		saynn("[say=eliza]Aww... You're so dumb, it's almost adorable. It's oxygen, silly.[/say]")

		saynn("[say=pc]B-But everyone knows water keeps you [b]hydrated[/b], not oxygenated![/say]")

		saynn("[say=eliza]Did you forget the part where I said its symbol was 'O'? 'O', as in oxygen?[/say]")

		saynn("Damn, you did forget that part.")

		addButton("Next", "See the next question", "question4")

	if(state == "Zeronium"):
		saynn("[say=pc]Zeronium.[/say]")

		saynn("Hey, at least it sounds impressive.")

		saynn("[say=eliza]You're just making stuff up at this point.[/say]")

		saynn("Yeah, that wasn't going to work on her. But maybe you can still find a way to make it sound impressive?")

		saynn("[say=pc]Maybe I am. Because making stuff up and seeing what sticks is basically the scientific method, isn't it?[/say]")

		saynn("[say=eliza]Us scientists prefer to be a little more precise... But you're not totally wrong, either.[/say]")

		saynn("Better than nothing!")

		saynn("[say=eliza]The answer is oxygen, by the way. Try breathing a little more deeply: you might benefit from getting more of it to your brain.[/say]")

		addButton("Next", "See the next question", "question4")

	if(state == "Osmium"):
		saynn("[say=pc]Osmium?[/say]")

		saynn("[say=eliza][b]Really?[/b][/say]")

		saynn("[say=pc]I dunno, it sounds like a fancy chemical. Not like I'm gonna know the answers to any of these questions anyway.[/say]")

		saynn("[say=eliza]Not with that mindset, you won't. Does [b]oxygen[/b] sound familiar to you?[/say]")

		saynn("Oh.")

		saynn("[say=eliza]See? Try to at least think about the questions before you answer them.[/say]")

		saynn("[say=pc]But you're barely giving me any time to-[/say]")

		saynn("[say=eliza]NEXT QUESTION![/say]")

		saynn("She's doing this on purpose, isn't she?")

		addButton("Next", "See the next question", "question4")

	if(state == "question4"):
		saynn("[say=eliza]What is the name of the coordination complex with the formula [Fe(CN)6]3-, used in the production of a particular deep blue dye, as well as various other chemical applications?[/say]")

		saynn("What the heck is that formula?...")

		addButton("Prussian blue","Is this your final answer?","Prussian blue")
		addButton("Methamphetamine","Is this your final answer?","Methamphetamine")
		addButton("Ferricyanide","Is this your final answer?","Ferricyanide")
		addButton("Thatimabewelwithine","Is this your final answer?","Thatimabewelwithine")
	
	if(state == "Prussian blue"):
		saynn("[say=pc]Prussian blue.[/say]")

		saynn("[say=eliza]Aww, so close! Prussian blue is the dye it can make, but not the coordination complex itself. The answer is [b]ferricyanide[/b].[/say]")

		saynn("What is this cat's deal with cyanide?")

		saynn("[say=eliza]Even then, lots of people would say you actually made Turnbull's blue. And take care not to confuse it with the [b]ferrocyanide[/b] anions in the dyes themselves.[/say]")

		saynn("This is getting out of hand.")

		saynn("[say=eliza]By the way, where have you heard of prussian blue before?[/say]")

		if(getFlag("Player_Crime_Type") == Flag.Crime_Type.Murder):
			saynn("[say=pc]It's an antidote for thallium poisoning.[/say]")

			saynn("[say=eliza]How do you know [b]that?[/b][/say]")

			saynn("[say=pc]Accidents happen.[/say]")
		elif(getFlag("Player_Crime_Type") == Flag.Crime_Type.Theft):
			saynn("[say=pc]It's what gives blueprints their color. Don't remember where I read that, though.[/say]")

		else:
			saynn("[say=pc]To be honest, I don't even know what's so prussian about it.[/say]")

		saynn("[say=eliza]Fair enough.[/say]")

		addButton("Next", "See the next question", "question5")

	if(state=="Methamphetamine"):
		saynn("[say=pc]Methamphetamine.[/say]")

		saynn("Eliza chuckles.")

		saynn("[say=pc]What? Everyone knows that pure meth is blue.[/say]")

		saynn("[say=eliza]Sorry {pc.name}, but television lied to you. Pure meth is actually white, and has a completely different chemical makeup.[/say]")

		saynn("No way. Next she'll tell you that meth isn't made with muriatic acid, caustic soda, and hydrogen chloride!")

		saynn("[say=eliza]The correct answer is ferricyanide: love that one, by the way.[/say]")

		saynn("[say=pc]C'mon, we already had cyanide![/say]")

		addButton("Next", "See the next question", "question5")

	if(state == "Ferricyanide"):
		grade += 1

		saynn("[say=pc]Ferricyanide.[/say]")

		saynn("[say=eliza]Love that one! But how did you know that?[/say]")

		saynn("You point at the \"I ♥ Ferricyanide, AKA [Fe(CN)6]3-\" poster on the wall behind Eliza.")

		saynn("[say=eliza]I forgot I put that there.[/say]")

		saynn("[say=pc]The question still counts though, right?[/say]")

		saynn("[say=eliza]Sure, whatever.[/say]")

		saynn("You got lucky with that one.")

		addButton("Next", "See the next question", "question5")

	if(state == "Thatimabewelwithine"):
		saynn("[say=pc]Thatimabewelwithine.[/say]")

		saynn("You and Eliza hear a lab tech chuckle nearby. At least she gets it.")

		saynn("[say=eliza]Wrong... It's ferricyanide! Love that one, by the way.[/say]")

		saynn("[say=pc]Well, between you and me, I'm more of a [Fe(CN)6]5- kind of person.[/say]")

		saynn("[say=eliza]That's not even-[/say]")

		saynn("That same bystander can't help but burst into laughter. Eliza turns to glare at her: she falls dead silent and quickly walks away from the lobby.")

		saynn("[say=eliza]Is there some kind of joke I should be aware of?[/say]")

		saynn("[say=pc]Sorry, sorry. Next question, please.[/say] You don't want to provoke her wrath any further.")

		addButton("Next", "See the next question", "question5")

	if(state == "question5"):
		saynn("[say=eliza]What is the name of the organic compound with the formula C(CH2OH)4, commonly known as a type of polyol and used in the production of plastics and resins?[/say]")

		saynn("[i]She is just trying to bury you at this point...[/i]")

		addButton("Tetramethyl orthocarbonate","Is this your final answer?","failQ5")
		addButton("Diisopropyl phthalate","Is this your final answer?","failQ5")
		addButton("Pentaerythritol","Is this your final answer?","passQ5")
		addButton("Xylitol","Is this your final answer?","failQ5")
		addButton("Iwanitol","Is this your final answer?","iwanitol")
		addButton("Polyethylene terepthalate","Is this your final answer?","failQ5")
		addButton("Glycerol","Is this your final answer?","failQ5")
		addButton("Cinoxate","Is this your final answer?","failQ5")

	if(state == "failQ5"):
		saynn("Let's be honest: you have no fucking clue.")

		saynn("[say=pc]Plastic is made out of oil, I don't know..[/say]")

		saynn("[say=eliza]Pentaerythritol![/say]")

		saynn("[say=pc]How can you even spell that?[/say]")

		addButton("Next", "See the next question", "question6")

	if(state == "iwanitol"):
		saynn("[say=pc]Iwanitol.[/say]")

		saynn("Is that even a real thing?")

		saynn("[say=eliza]Nope! Pentaerythritol![/say]")

		saynn("So much for miracles.")

		addButton("Next", "See the next question", "question6")

	if(state == "passQ5"):
		grade += 1

		saynn("[say=pc]Pentaerythritol.[/say]")

		saynn("Eliza narrows her eyes at you.")

		saynn("[say=eliza]You're not [b]cheating[/b], are you, {pc.name}?[/say]")

		saynn("[say=pc]How could I be cheating? I'm sitting right in front of you.[/say]")

		saynn("[say=eliza]If that's the case, tell me how you knew the answer.[/say]")

		saynn("Damn, that's actually a really good question. How [b]did[/b] you know the answer to that one?")

		if(getFlag("Player_Crime_Type") == Flag.Crime_Type.Theft):
			addButton("The Score", "Someone hired you to steal some once", "story_score")
		elif(getFlag("Player_Crime_Type") == Flag.Crime_Type.Murder):
			addButton("The Project", "You tried to do some home redecorating once", "story_project")
		elif(getFlag("Player_Crime_Type") == Flag.Crime_Type.Prostitution):
			addButton("The Client", "A former client told you about it", "story_client")
		addButton("PSA", "You saw it in an ad a long time ago", "story_psa")
		addButton("Song", "You heard it in a song", "story_song")

		if(cheater):
			addDisabledButton("Cheating", "I looked it up")
		else:
			addButton("Cheating", "I looked it up", "cheated")

	if(state == "story_score"):
		saynn("[say=pc]A couple years ago, these guys in one of the outer colonies wanted a shipment of the stuff, and we got a lead on a convoy we thought we could intercept.[/say]")

		saynn("[say=eliza]What did they need it for, exactly?[/say]")

		saynn("[say=pc]Didn't ask. But we did our homework, and like you said, they use it in all sorts of stuff. Would've been embarrassing if we'd taken the wrong chems by accident.[/say]")

		saynn("[say=eliza]I'm guessing the heist didn't go well, though?[/say]")

		saynn("[say=pc]We, uh... We didn't actually get to do the heist. We all came down with food poisoning the day the shipment came through.[/say]")

		saynn("That was the last time you bought convenience store sushi.")

		saynn("[say=eliza]Ouch.[/say]")

		saynn("[say=pc]Oh yeah, the buyers were pissed. Wasn't easy to make it up to them... But that's another story.[/say]")

		saynn("[i]Looks like she believes you![/i]")

		addButton("Next", "See the next question", "question6")

	if(state == "story_project"):
		saynn("[say=pc]A while back, I was working on a home project, and I needed some plastic explosive for it.[/say]")

		saynn("At this point, Eliza isn't phased by it.")

		saynn("[say=pc]That stuff's hard to buy though, so I asked a friend, and he said he could make it for me if I helped him get some supplies. Ethanol, nail polish remover, a bucket of seashells, and some other junk. I thought he was joking, but we went over it in detail, and he showed me how it was all gonna work. He made a big deal about how we'd be making pentaerythritol, and how we could use that to make the stuff.[/say]")

		saynn("You thought Eliza might've been scared, but her eyes are beaming now.")

		saynn("[say=eliza]Sounds like a day at the beach to me! I didn't know you had such interesting friends. Did it work?[/say]")

		saynn("[say=pc]Well... He went and used all of it. At once. By accident.[/say]")

		saynn("She nods in sympathy.")

		saynn("[say=eliza]Yup, that'll happen.[/say]")

		saynn("[i]Looks like she believes you![/i]")

		addButton("Next", "See the next question", "question6")

	if(state == "story_client"):
		saynn("[say=pc]There was a client who liked to visit me whenever they were in town. They worked in cosmetics, or something; they talked about their work a lot. They were working on a formula for some kind of new skin cream, and the pentaerythritol was [b]really[/b] important for... Something. I don't really remember, but talking about it really seemed to get them off. Either that or they were just blowing off steam. It sounded kinda stressful.[/say]")

		saynn("[say=eliza]All of this, during sex?[/say]")

		saynn("[say=pc]Some days we didn't even [b]have[/b] sex. They'd just pull up a slideshow and talk about their project: one of the slides was all about that fucking pentaerythritol. I think they were practicing for their meetings...[/say]")

		saynn("Eliza sighs.")

		saynn("[say=eliza]Sounds about right.[/say]")

		saynn("[i]Looks like she believes you![/i]")

		addButton("Next", "See the next question", "question6")

	if(state == "story_psa"):
		saynn("[say=pc]Back when I was a kid, I would see these weird ads everywhere. They all said things like, 'Are you aware of pentaerythritol?' Sometimes they would have chemical formulas, photos of some white powder, other stuff it was used in... There was even a whole website about it.[/say]")

		saynn("[say=eliza]You can't be serious.[/say]")

		saynn("[say=pc]Hey, you can look it up yourself. I did a few years later, when I couldn't tell if I'd just imagined it or not. Apparently the guy who paid for them was crazy and thought the stuff was evil.[/say]")

		saynn("After a few minutes of searching on her computer, Eliza finds an archive of the website. \"PENTAERYTHRITOL FACT #41: Pentaerythritol is an anagram for 'I try athlete porn'. How would it know what kind of porn I watch if it wasn't DEMONIC?!\"")

		saynn("[say=eliza]Wow. You really weren't kidding, huh?[/say]")

		saynn("You almost wish you were.")

		saynn("[i]Looks like she believes you![/i]")

		addButton("Next", "See the next question", "question6")

	if(state == "story_song"):
		saynn("[say=pc]I used to listen to this band a friend showed me once. Lots of the songs were about science and stuff. Didn't make any sense to me, but the music was cool.[/say]")

		saynn("[say=eliza]You're telling me there's a [b]song[/b] about pentaerythritol?[/say]")

		saynn("[say=pc]Not a song: it's a whole [b]concept album[/b]. Look it up.[/say]")

		saynn("It doesn't take long for Eliza to find it on streaming. The track listing features songs like, \"C(CH2OH)4\", \"Firefight\", \"PETPlay\", \"I Want Your Semtex\", and \"2,2-Bis(hydroxymethyl)propane-1,3-diol\". That last one's fifteen minutes long.")

		saynn("[say=eliza]Wow. How have I never heard of these guys before?[/say]")

		saynn("She adds the album to her library. Hopefully she enjoys it when she actually listens to it.")

		saynn("[i]Looks like she believes you![/i]")

		addButton("Next", "See the next question", "question6")

	if(state == "question6"):
		saynn("[say=eliza]What is the name of the compound with the formula NaCl, commonly used as a seasoning and preservative?[/say]")

		saynn("Seasoning..")

		addButton("Salt","Is this your final answer?","salt")
		addButton("Vinegar","Is this your final answer?","vinegar")
		addButton("Sodium chloride","Is this your final answer?","sodium chloride")
		addButton("Nickel","Is this your final answer?","nickel")

	if(state == "salt"):
		grade += 1

		saynn("[say=pc]You mean.. salt?[/say]")

		saynn("Doctor Quinn hums.")

		saynn("[say=eliza]Actually, its proper name is Sodium chloride.[/say]")

		saynn("What a nerd.")

		saynn("[say=eliza]But whatever, I'll still give it to you.[/say]")

		saynn("A generous nerd, at least.")

		addButton("Finish","Let's wrap this up","assess_grade")

	if(state == "vinegar"):
		saynn("[say=pc]Vinegar.[/say]")

		saynn("You have no idea what that formula was, but you know that vinegar is both a seasoning and a preservative. This has gotta be it.")

		saynn("[say=eliza]Wrong![/say]")

		saynn("Aw, man! You thought you had it!")

		saynn("[say=eliza]I'll give you a hint: what else would you add to a really basic vinegar seasoning? Maybe with potato chips?[/say]")

		saynn("Damn, you haven't even [b]seen[/b] a potato chip in forever. What you wouldn't give for some crunchy, salty... Wait a minute...")

		saynn("[say=pc]Salt?[/say]")

		saynn("Doctor Quinn hums.")

		saynn("[say=eliza]Actually, its proper name is sodium chloride.[/say]")

		saynn("What a nerd.")

		saynn("[say=pc]So uh, do I get the point?[/say]")

		saynn("[say=eliza]Mmm... No.[/say]")

		saynn("At least it didn't hurt to ask.")

		addButton("Finish","Let's wrap this up","assess_grade")

	if(state == "sodium chloride"):
		grade += 1

		saynn("[say=pc]Sodium chloride.[/say]")

		saynn("[say=eliza]Very good! I would've guessed that you'd just say 'salt'.[/say]")

		saynn("[say=pc]Do I get bonus points?[/say]")

		saynn("[say=eliza]Don't push it.[/say]")

		saynn("Fair enough.")

		addButton("Finish","Let's wrap this up","assess_grade")

	if(state == "nickel"):
		saynn("[say=pc]Nickel.[/say]")

		saynn("[say=eliza]... What?[/say]")

		saynn("[say=pc]You said it yourself: 'N-A-C-L'. That spells nickel.[/say]")

		saynn("Eliza stares at you in bewilderment.")

		saynn("[say=eliza]Do you put [b]nickel[/b] on your food?[/say]")

		saynn("[say=pc]Hey, I don't know what it is they serve in the cafeteria, but I wouldn't be surprised if there was at least a little nickel in there.[/say]")

		saynn("After taking a moment to process your response, Eliza throws her paws up and sighs in exasperation.")

		saynn("[say=eliza]Sodium chloride. [b]Salt[/b]. The answer was salt.[/say]")

		saynn("Salt... That actually makes a lot more sense. Oh well.")

		addButton("Finish","Let's wrap this up","assess_grade")

	if(state == "assess_grade"):
		if grade < 4:
			if grade <= 1:
				saynn("That didn't go so well...")

				saynn("[say=eliza]Congratulations. "+("You managed to get every single question wrong." if grade == 0 else "You got exactly one question right.")+"[/say]")

				saynn("[say=pc]Don't know what you were expecting.[/say]")

				saynn("[say=eliza]Honestly, neither do I.[/say]")
			
			elif grade <= 3:
				saynn("[say=eliza]"+str(grade)+" for 6. "+("That's pretty weak." if grade==2 else "Not terrible, but not impressive.")+"[/say]")

				saynn("[say=pc]You didn't even give me a proper chance![/say]")

				saynn("[say=eliza]Sounds like excuses. Science has no space for excuses![/say]")

				saynn("You can only sigh.")

				saynn("[say=pc]So?[/say]")

				saynn("[say=eliza]Well..[/say]")

			saynn("She looks around the lobby, her paw grips her personal coffee mag, her clawed thumb tapping a rhythm on it.")

			saynn("[say=eliza]"+("But believe it or not, " if grade < 2 else "You know.. ")+"you still did better than all the others. I usually just get drug junkies.[/say]")

			saynn(("What's that? She's still giving you a chance?" if grade < 2 else "A sign of hope?"))

			addButton("Continue","Listen to what she has to say","ask_skills")
		elif grade < 6:
			saynn("[say=eliza]"+str(grade)+" for 6. Not bad. Compared to all the other applicants, you're basically a genius.[/say]")
		
			saynn("[say=pc]Really?[/say]")

			saynn("[say=eliza]Well, maybe more like a freshman chemistry student, but you're definitely trainable.[/say]")

			saynn("Sounds like you exceeded her expectations.")
		
			addButton("Continue","Congratulations on the job!", "after_test")
		else:
			saynn("She stares at you - partly in awe, mostly in confusion - her jaw hanging slightly open.")

			var playerAdj = ""
			if(getFlag("Player_Crime_Type") == Flag.Crime_Type.Murder):
				playerAdj = "a crazed killer"
			elif(getFlag("Player_Crime_Type") == Flag.Crime_Type.Prostitution):
				playerAdj = "a street whore"
			else:
				playerAdj = "a petty crook"

			saynn("[say=eliza]How does "+playerAdj+" like you know all this stuff?[/say]")

			var oralvalue = GM.pc.getFetishHolder().getFetishValue(Fetish.OralSexGiving)
			if(oralvalue > 0):
				saynn("You flash a playful smile.")
				saynn("[say=pc]I excel at oral exams.[/say]. You wink at her.")
				saynn("[say=eliza]Is that so? Maybe you can show me again sometime.~[/say]")
			else:
				saynn("You shrug.")
				saynn("[say=eliza]Fair enough. Needless to say, I'm impressed.[/say]")
			saynn("You managed to ace her test. That must mean you got the job... Right?")

			addButton("Continue",("You still cheated, though" if cheater else "Props to you!"),"after_test")

	if(state == "ask_skills"):
		saynn("[say=eliza]Maybe you can be useful in other ways. Tell me, what exactly [b]are[/b] you good at? How would you be able to help me expand the frontiers of science?[/say]")

		saynn("Hey, you've gotta be good at [b]something[/b].")

		addButton("Resourceful", ("[i]I can get you the goods[/i]" if getFlag("Player_Crime_Type") == Flag.Crime_Type.Theft else "I know how to get things done"), "resourceful")
		addButton("Bold", ("[i]I have killer instincts... For science, of course[/i]" if getFlag("Player_Crime_Type") == Flag.Crime_Type.Murder else "I enjoy taking on challenges"), "bold")
		addButton("Passionate", ("[i]Business and pleasure go hand-in-hand with me[/i]" if getFlag("Player_Crime_Type") == Flag.Crime_Type.Prostitution else "I'm driven by my work"), "passionate")

	if(state == "resourceful"):
		if(getFlag("Player_Crime_Type") == Flag.Crime_Type.Theft):
			saynn("[say=pc]What do you need to do all this science? Supplies? Equipment? Money? Anything you need, I can get it for you.[/say]")

			saynn("Eliza chuckles.")

			saynn("[say=eliza]You don't think AlphaCorp takes care of all of that for me already?[/say]")

			saynn("[say=pc]Come on, there's gotta be something you need that they can't hook you up with, or that I can swipe- uh, find at a bargain. Just point me in the right direction.[/say]")

			saynn("You see the gears start to turn in her head as she considers your offer. Her lips stretch into a devious grin.")

			saynn("[say=eliza]You know what? You might be onto something~...[/say]")

			addButton("Continue","Seems she has a position for you after all","after_test")
		
		else:
			saynn("[say=pc]I'm a strong problem solver.[/say]")

			saynn("[say=eliza]Oh, really?[/say]")

			saynn("[say=pc]I know what you're thinking - 'If this "+GM.pc.getSpeciesFullName().to_lower()+" is such a strong problem solver, how did they end up in prison?' The answer is, "+("the system is rigged, and you know it." if getFlag("Player_Crime_Type") == Flag.Crime_Type.Innocent else "the best solutions aren't always the legal ones.")+"[/say]")

			saynn("Eliza nods in agreement.")

			saynn("[say=eliza]Hard to disagree with that. Maybe you can help me after all...[/say]")

			addButton("Continue", "Somehow, you've convinced her to hire you","after_test")

	if(state == "bold"):
		if getFlag("Player_Crime_Type") == Flag.Crime_Type.Murder:
			saynn("[say=pc]You say you need test subjects?[/say]")

			saynn("[say=eliza]Yes, but if I wanted to experiment on you, I would've already-[/say]")

			saynn("[say=pc]How many?[/say]")

			saynn("She tilts her head at you.")

			saynn("[say=eliza]Excuse me?[/say]")

			saynn("[say=pc]How many people do you need? What kinds? How cooperative do they need to be? And do you prefer them conscious, or-[/say]")

			saynn("She holds her paw out in front of her, gesturing you to stop.")

			saynn("[say=eliza]I guess I should've expected this from a red. But you know what? I might actually have just the job for you~...[/say]")

			addButton("Continue","Seems she has a position for you after all","after_test")

		else:
			var dickAdj = "hard to swallow"

			if ("feline" in GM.pc.getSpecies()):
				dickAdj = "barbed"
			elif ("canine" in GM.pc.getSpecies()):
				dickAdj = "knotted"
			elif ("human" in GM.pc.getSpecies()):
				dickAdj = "circumcised"
			elif ("equine" in GM.pc.getSpecies()):
				dickAdj = "flared"
			saynn("[say=pc]I won't lie, this science stuff sounds pretty hard. But that's never stopped me before![/say]")

			saynn("[say=eliza]Science isn't a dick in your face while you're in the stocks, {pc.name}. It's not just 'hard'.[/say]")

			saynn("[say=pc]You're right. It's also rough, dirty, and sometimes "+dickAdj+ ". But it can also be a lot of fun.[/say]")

			saynn("Eliza nods in agreement.")

			saynn("[say=eliza]Hard to disagree with that. Maybe you can help me after all...[/say]")

			addButton("Continue", "Somehow, you've convinced her to hire you","after_test")


	if(state == "passionate"):
		if (getFlag("Player_Crime_Type") == Flag.Crime_Type.Prostitution):
			saynn("[say=pc]Well, I practically have a degree in [b]sexual[/b] chemistry! That's gotta count for something, right?[/say]")

			saynn("Eliza rolls her eyes, and a slight smirk forms on her face.")

			saynn("[say=eliza]I should've seen that coming. I think we can work with that~.[/say]")

			addButton("Continue","Seems she has a position for you after all","after_test")

		else:
			saynn("[say=pc]Science is just... It's so cool, you know? I've always been interested in it... Kinda...[/say]")

			saynn("Eliza frowns.")

			saynn("[say=eliza]You say that, but you also failed the quiz I just gave you.[/say]")

			saynn("[say=pc]Well... What I'm trying to say is, I never had the opportunity to actually study it, but it [b]looks[/b] amazing. I bet if you just gave me a chance, I could [b]be[/b] amazing at it too.[/say]")

			saynn("You sit quietly as Eliza mulls it over. If this doesn't work, you can kiss this job goodbye.")

			saynn("[say=eliza]Alright, fine.[/say]")

			saynn("[i]Really?![/i]")

			addButton("Continue", "Somehow, you've convinced her to hire you","after_test")

	if(state == "after_test"):

		saynn("[say=eliza]But you will have to prove yourself a bit. I can't just trust a random inmate with my precious chemistry lab.[/say]")

		saynn("Sounds reasonable.")

		saynn("[say=pc]Sure. How can I prove myself?[/say]")

		saynn("She scratches her chin.")

		saynn("[say=eliza]Nursery lobby.. the room that's connected to this main lobby.. has a bounty board of sorts. Complete a few tasks there and then I will think about it.[/say]")

		saynn("[say=pc]Nursery? Bounty board? What does that have anything to do with chemistry or researching?[/say]")

		saynn("Doctor frowns.")

		saynn("[say=eliza]There is a direct connection. We put up tasks there because that's what we need to push science forward![/say]")

		saynn("Better not anger the science cat it seems.")

		saynn("[say=pc]Alright. I get it.[/say]")

		saynn("She nods.")

		saynn("[say=eliza]If that is all.. I have coffee I need to drink.[/say]")

		saynn("You let her sip her life juice and step away from the counter..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action in ["Strychnine","Carboxylic acid", "Atropine"]):
		answer = _action
		setState("failQ1")
		return

	if(_action in ["Nitrate", "Bleach"]):
		answer = _action
		setState("failQ2")
		return

	if(_action == "cheated"):
		cheater = true
		addMessage("Shame on you! But if you tell that to Eliza, who knows what'll happen? Better come up with another story...")
		return

	if(_action == "after_test"):
		processTime(3*60)
		addMessage("New task added!")
		addMessage("Bounty board is now available in the nursery!")

	setState(_action)
