extends SceneBase

var kaitFondness
var sparklingWater = false
var voiceOfGod = false
var originalJoke = false
var notAFurry = false

func _init():
	sceneID = "KaitQuestBriefing"

func _initScene(_args = []):
	if _args.has("kaitVisitingPlayer"):
		state = "kaitVisit"
	kaitFondness = getModuleFlag("MoonAF26", "kaitFondness", 0)

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "idle")

		if hasCharacter("kait"): removeCharacter("kait")

		addCharacter("moon")

		saynn("Huh? Where are you? One minute you were with Kait, and the next, you're...")

		saynn("[say=moon]Fuck, fuck, fuck, it's already past midnight?![/say]")

		saynn("You're pretty sure it's not." + (" Then again, it was getting pretty late." if GM.main.isVeryLate() else ""))

		saynn("[say=pc]Hello? Who's there?[/say]")

		saynn("You don't see anybody around. In fact, you don't really know what to make of your surroundings. They're kind of... Vague? But you get the sense that someone is looking at you.")

		saynn("[say=moon]Oh. My God. Stay calm, stay calm...[/say]")

		saynn("[say=pc]What's going on? Where the hell am I? Where's Kait?[/say]")

		saynn("You hear a disappointed sigh.")

		saynn("[say=moon]You're already here. That means the module is already finished. I ran out of time to put more stuff in. Damn, and I was hoping to throw in an actual sex scene, too...[/say]")

		saynn("What the fuck?")

		addButton("Continue", "Oh, boy...", "whereami")

	if(state == "whereami"):
		saynn("[say=pc]What do you mean? The \"module\" is over? You ran out of time? Who are you?[/say]")

		saynn("[say=moon]I'm the person who wrote this little scenario for you. Or at least, what I managed to write before it turned April. I was working on an April Fools mod, but a lot of shit happened this month, and I didn't have half as much time as I thought I would.[/say]")

		saynn("[say=pc]April Fools? Scenario? I'm so confused.[/say]")

		saynn("The disembodied entity buries its face in its hands.")

		saynn("[say=moon]God, I hate metafiction...[/say]")

		saynn("You hear a [b]snap[/b], and realize that you're a character in a furry porn video game. This doesn't alarm you in the slightest.")

		saynn("[say=pc]Oh, right. So what is this, exactly? Is my quest with Kait already over?[/say]")

		saynn("[say=moon]Pretty much. I did as much as I could to start it, but I never actually planned on finishing it. You were always gonna end up here, one way or another.[/say]")

		saynn("So this was basically a joke, disguised as a demo? Or was it a demo disguised as a joke? Maybe it was a little bit of both.")

		saynn("[say=moon]If you'd like, I can answer any other questions you have. At least, the ones I anticipated you'd have in advance.[/say]")

	if(state == "whatAreYou"):
		saynn("[say=pc]So who or what am I talking to, exactly?[/say]")

		saynn("[say=moon]I'm MOON_HALO. I created a couple of mods for BDCC: mostly utilities like DatapackCharacterToPlayer and QuickStart. I also do some backend work on the [i]Dark Days[/i] datapack by Sumobear50. I've wanted to do my own narrative mod for a while now, but the original concept I had for it sputtered out a while ago.[/say]")

		saynn("[say=pc]Wow, that's really cool! And I'm sorry to hear that your other mod didn't work out.[/say]")

		saynn("[say=moon]Thanks for the kind words, {pc.name}, whose dialogue I have full control over.[/say]")

		saynn("[say=pc]So then you decided to do an April Fools mod instead?[/say]")

		saynn("[say=moon]Yeah, I had the idea since around the beginning of this year. If I had a nickel for every time I made an elaborate fangame of a niche porn game with a half-decent story for April Fools, I'd have two nickels. But I had a lot more free time back then to make the other one. I didn't get as far on this mod as I'd hoped.[/say]")

		saynn("[say=pc]Why can't I see you? You couldn't be bothered to add your sona to the game?[/say]")

		saynn("[say=moon]Even if I had one of those, I didn't have time to add it. Plus, this way, nobody can take my doll and have it get railed by a massive, barbed cat cock while bound like a roasted turkey.[/say]")

	if(state == "whyKait"):
		saynn("[say=pc]Why make the April Fools mod about Kait's unfinished quest?[/say]")

		saynn("[say=moon]Why not? I haven't played through all of the game's side content, but I've done a lot of the main stuff: Tavi's main quest, most of Alex's story, the chemistry stuff with Eliza and her romance route, Socket's funny little adventures, the fight club with Avy... I was close to romancing Rahi (the in-game character) all the way through on my first save, but then I lost it and had to start all over. Always back up your saves when you're playing the web version, folks.[/say]")

		saynn("The author inserts a pause to break up their dialogue, in order to enhance clarity and flow:")

		saynn("[say=moon]So when I played through the Fight Club content and saw the pitch for Kait's quest - you earn her respect in the ring, she's assembling a team to break out, some really cool sounding stuff that didn't require someone to step on me - I was kinda disappointed that it wasn't finished. Sure, working for Wright early on isn't finished yet either, but frankly, I like the other one a lot more.[/say]")

		saynn("[say=pc]Do you just have a thing for Kait in general?[/say]")

		saynn("[say=moon]Not at first. The character grew on me as I dug through the little bits of her that we've seen so far to try and piece together who she was. She's a foil to Tavi, so I figured that it'd make sense for her content to be the opposite of Tavi's in a few different ways. Instead of a dom, she's a sub - not a mindless cat in heat or a fuckable assistant, but just someone who wants you to take the lead sometimes. I'd want to aim it at people who don't want to go through the early parts of Tavi's quest where they're forced to submit to her, and also people who want to try and finish the game without having any sex.[/say]")

		saynn("[say=pc]Huh? You're playing a porn game, and you don't wanna have sex?![/say]")

		saynn("[say=moon]Personally - and I'm probably in the smallest minority here - I like to try and play through these kinds of games as cleanly as I can on my first time through. Partly for the challenge, and partly to see how well the story holds up without it. I go and finish all the other content afterwards. Lots of the sidequests in BDCC are already designed like that, the fight club especially, but the main quest still requires you to get a little dirty from the get-go.[/say]")

		saynn("It's not even that I don't like the main quest, most of it is pretty solid.")

		saynn("[say=moon]Besides, this was quicker and easier to make than my original idea for the April Fools mod.[/say]")

	if(state == "sparklingWater"):
		saynn("[say=pc]What kind of mod were you working on before?[/say]")

		saynn("[say=moon]A mod about poisoning BDCC's water supply.[/say]")

		saynn("What.")

		saynn("[say=moon]Like half the things I do, it started as a joke. Something about sparkle dogs, which turned into some hypno stuff, which I ultimately envisioned as an elaborate scheme to develop mind-controlling pheromones in Eliza's lab, genetically engineer yourself some cool powers, and then spread them all throughout the station.[/say]")

		saynn("[say=pc]Sounds complicated. Was the backend stuff too much to handle?[/say]")

		saynn("[say=moon]No, the backend stuff was the easy part, mostly. A lot of that work is still on my GitHub fork of BDCC. Half the trouble is that I had trouble actually figuring out a good quest design with those mechanics. God, how Rahi (the creator) manage to do any of this stuff astounds me, It's amazing she finished the Tavi quest at all. The other half had to do with the supporting characters I was writing for it. This cute couple that worked for the station, decent people who'd be willing to help you out as the story progressed.[/say]")

		saynn("[say=pc]What happened with them?[/say]")

		saynn("[say=moon]Oh, you know. The voice of God compelled me to stop writing their story. You know how it is.[/say]")

		saynn("[b]What.[/b]")

	if(state == "batman"):
		saynn("[say=pc]No, I don't know how it is. I'm not sure most people would know how it is. Is this a religious thing?[/say]")

		saynn("[say=moon]Oh no, not at all. I just felt like the eyes of God were watching me at some point, and I guess my soul couldn't bear the weight of my sins.[/say]")

		saynn("[say=pc]Jesse, what the fuck are you talking about?[/say]")

		saynn("[say=moon]Okay, so it goes like this: I wanted to have this nice, cute couple as supporting characters. One of them would be a lab tech that works for Eliza - she'd be this minty-green fox thing. The other would be a half-feline engineer who helps maintain the station's water infrastructure: he'd handle the plumbing, the heaters, sterilization, that sort of thing. The regular path would be you getting to know both of them, sort of figuring their story out, and then they'd eventually decide to help you.[/say]")

		saynn("[say=pc]What's wrong with that?[/say]")

		saynn("[say=moon]I know my audience. I know some of them would just want to fuck them. In, like, really brutal and degrading ways. So I was conceptualizing a bad guy route, for the sake of player autonomy. Instead of befriending them, you'd just kinda ruin their lives and torture them for fun.[/say]")

		saynn("[say=pc]How far did you get with that?[/say]")

		saynn("[say=moon]Well, let's see: By the time I was planning out the ending where you'd kill the entire station, the fox's boyfriend included, and dragged her onto a shuttle with you, half-zonked out of her mind on mind-altering drugs... That's when the Batman music hit my playlist.[/say]")

		saynn("[say=pc]The... Batman music?[/say]")

		saynn("[say=moon]Yeah, the main theme from Arhkam City. The London Philharmonic Orchestra recorded a wonderful arrangement of it. In that moment, my heart sank so hard. I asked myself, \"What kind of a monster would do this sort of thing? Why am I spending so much effort writing this? Do I even like where I'm going with this?\" And so I just dropped it.[/say]")

		saynn("[say=pc]So... It wasn't the voice of God?[/say]")

		saynn("[say=moon]Of course not. It was Batman. I felt like he was watching me from, like, a gargoyle or something. It was a little scary. So I dropped the whole project, then and there.[/say]")

		saynn("Somehow, this is only getting more confusing...")

	if(state == "originalJoke"):
		saynn("[say=pc]You said you had another idea for an April Fools mod? What was it?[/say]")

		saynn("[say=moon]Oh, you know... I kinda sorta wanted to turn all of the characters into humans.[/say]")

		saynn("[say=pc]Excuse me?[/say]")

		saynn("[say=moon]Oh, yeah. I'd already finished the work for Risha, Eliza, the detective from the intro, most of the arena fighters, and Captain Wright. Not their portraits, of course, but the dolls were changed and a lot of the text was revised. Let me tell you, rigging Risha's piercings onto a human head is not something I'm proud to let go to waste.[/say]")

		saynn("[say=pc]But why? This is a game for furries! Who would want that?[/say]")

		saynn("[say=moon]Probably nobody. That's what made it so funny.[/say]")

		saynn("The author shrugs.")

		saynn("[say=moon]Besides, do you [b]really[/b] have to be a furry to enjoy this game?[/say]")

		saynn("[say=pc]Yes? It's a furry game? With lots of furry sex? For furries?[/say]")

		saynn("[say=moon]Okay, but... Is it really?[/say]")

	if(state == "notAFurry"):
		saynn("[say=pc]Okay... Just answer me clearly: are you a furry?[/say]")

		saynn("[say=moon]What is a furry?[/say]")

		saynn("[say=pc]Someone who jerks off to furry porn.[/say]")

		saynn("[say=moon]I can't say I really do that.[/say]")

		saynn("[say=pc]Someone who [b]reads[/b] furry porn. Someone who writes furry porn for a furry porn game.[/say]")

		saynn("[say=moon]I mean... I guess BDCC has made me a little more ambivalent towards it. I was definitely more turned off by it before. But now, I guess I just see them as regular people. Some of them are kinda cute, even.[/say]")

		saynn("[say=pc]How do you even find BDCC if you're not a furry?![/say]")

		saynn("[say=moon]Half of my friends are furries. The guy who introduced me to BDCC told me that it had a cool character creator, and he was right. He knew I liked playing NSFW stuff for fun, but I don't think he expected that I'd get so involved with this one in particular. It ended up becoming a neat way to practice working with Godot.[/say]")

		saynn("[say=pc]So... Playing BDCC turned you into a furry?[/say]")

		saynn("[say=moon]Again, what is a furry?[/say]")

		saynn("You look it up on Google. Wikipedia says, \"The furry fandom is a subculture defined by an interest in anthropomorphic animal characters. Members of the fandom, known as furries, create their own characters in the form of fursonas and fursuits, engaging with fellow furries on the internet and at furry conventions.\"")

		saynn("[say=pc]See? \"Defined by an interest in anthropomorphic animal characters.\" That's you! You're a furry![/say]")

		saynn("[say=moon]Well then, maybe anybody who simply likes Zootopia, Bad Guys, or Beastars is a furry. But I don't think that's the case. How do we define \"interest\"?[/say]")

		saynn("[say=pc]Uh, sexual interest would be a pretty big flag for anyone, I think.[/say]")

		saynn("[say=moon]It's just not really my thing, though. Besides, what about ace and aro furries?[/say]")

		saynn("[say=pc]You engage with fellow furries on the internet! You're on the BDCC Discord![/say]")

		saynn("[say=moon]But \"fellow furries\" only holds if I'm a furry, doesn't it?[/say]")

		saynn("[say=pc]You said you created your own furry characters for your mod![/say]")

		saynn("[say=moon]Yeah, but those weren't fursonas. They were just characters. I don't have a fursona. I couldn't even afford a fursuit if I wanted one, although I guess a lot of people can't either.[/say]")

		saynn("[say=pc]Well then, what would [b]you[/b] define a furry as?[/say]")

		saynn("[say=moon]I'd say you're a furry if you call yourself one.[/say]")

		saynn("[say=pc]Do you?[/say]")

		saynn("[say=moon]Do I?[/say]")

		saynn("[say=pc]DO YOU?[/say]")

		saynn("...\n\n...\n\n...")

		saynn("[say=moon]... I dunno. What do you think?[/say]")

		saynn("[say=pc]Where's my dialogue options?[/say]")

		saynn("[say=moon]It's really late and I'm not programming them in. Do you have any other questions?[/say]")

	if(state in ["whereami", "whatAreYou", "whyKait", "sparklingWater", "originalJoke", "voiceOfGod", "batman", "notAFurry"]):
		addButton("What Are You?", "What is a MOON_HALO?", "whatAreYou")
		addButton("Why Kait?", "Why make a joke mod about Kait's quest?", "whyKait")
		if sparklingWater:
			addButton("Scrapped Concept?", "What was your scrapped concept?", "sparklingWater")
		if voiceOfGod:
			addButton("Voice of God?", "What the hell are you talking about?", "batman")
		if originalJoke:
			addButton("Original Joke?", "What was the original April Fool's gag supposed to be?", "originalJoke")
		if notAFurry:
			addButton("Not a Furry?!", "You're not a furry?!", "notAFurry")
		addButton("Leave", "Return to the game", "goodbye")


	if(state == "goodbye"):
		saynn("[say=moon]Leaving so soon? I hope you enjoyed this little gag. Happy April Fools![/say]")
		if(not getModuleFlag("MoonAF26", "kaitCellVisited", false)):
			saynn("But wait, we have an important message before you go!")
			saynn("[say=moon]The mod might be basically over, but you can still visit Kait in the lilac cell block. There's not a lot to do, really - I would've liked to have at least one real sexual encounter finished, as a treat, but I couldn't manage to fit it in - but there's a couple other bits of dialogue you might enjoy. just letting you know.[/say]")

		addButton("Exit", "Thank you for playing!", "endthescene")

	if(state == "kaitVisit"):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "walk", {npc="kait", npcAction = "walk", flipNPC = true})
		saynn("You lead Kait into your cell. She takes a look around.")

		var kaitMsg

		if kaitFondness > 1:
			kaitMsg = "Wow, your cell is actually kinda nice! I mean... It's still a cell, but you know what I mean."

			kaitMsg += " It's so much bigger than mine." if getModule("NpcSlaveryModule").getSlavesSpace() > 0 else ""
			kaitMsg += " Ooh, you have a Sybian?!" if getModuleFlag("NpcSlaveryModule", "hasSybian", false) else ""
		else:
			kaitMsg = "Alright. I can work with this."

		saynn("[say=kait]"+kaitMsg+"[/say]")

		saynn("[say=pc]I'm trying not to get [b]too[/b] comfortable. We're trying to get out of here, remember?[/say]")

		saynn("[say=kait]Yeah, of course. Doesn't hurt to get a little settled in, though. It'll still be a long while before we're free, if we're even that lucky.[/say]")

		if kaitFondness >= 3:
			saynn("She chooses her next words very carefully:")

			saynn("[say=kait]I mean, I wouldn't mind visiting here more often. Staying over, even~[/say]")

			saynn("[say=pc]Huh?[/say]")

			saynn("She quickly lowers her head, gaze firmly towards the floor.")

			saynn("[say=kait]Only if you'd have me, of course.[/say]")

			addButton("Elaborate", "Ask that cat what she's getting at", "elaborate")
			addButton("No thanks", "Whatever she's getting at, you're not interested", "nothanks")
		else:
			saynn("She stretches.") #I don't fucking know how to break these dialogue blocks up sometimes

			saynn("[say=kait]Anyway, let's get down to business. Are you listening? Here's the plan...[/say]")

			addButton("Listen", "Cue the Mission: Impossible music...", "")
		
	if(state == "elaborate"):
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("[say=pc]Hold up. What are you getting at?[/say]")

		saynn("Her eyes widen as her pupils contract in embarrassment.")

		saynn("[say=kait]Isn't it obvious? I'm offering... I'm asking if you...[/say]")

		saynn("She hunches over, and crosses her arms.")

		saynn("[say=kait]Fuck it, I knew this was a bad idea.[/say]")

		saynn("[say=pc]I'm just a little confused right now. Back in the fight club, you told me you wanted to talk about assembling a team and getting out of this place. You seemed like, you know, the mastermind of the operation. But now you're coming on to me? In kind of a subby way?[/say]")

		saynn("She cringes.")

		saynn("[say=kait]Well, I can't help it. I... That's just how I am. With people I'm interested in.[/say]")

		saynn("[say=pc]You're interested in me? Already?![/say]")

		match getModuleFlag("MoonAF26", "fcGroperReaction"):
			"claim":
				saynn("[say=kait]You said it yourself back there: I'm yours, fair and square.[/say]")
			"reason":
				saynn("[say=kait]What can I say? You have a way with people. The way you handled the audience back there? That's not something everybody can do. You're one of the most level-headed people in this place. I like level-headed people.[/say]")
			"threaten":
				saynn("[say=kait]You're strong, sure, and really loud... But you're not an asshole. Most people like that walk around like they're alphas, and expect others to bend over for them because of it. You actually stood up for me, though. That's kinda hot.[/say]")
			"groping": #how did you even manage to get this far
				saynn("[say=kait]Look, you really pissed me off when you just let that guy touch me like that. But you're not so bad, actually.[/say]")
			"lost":
				saynn("[say=kait]Hey, I might be able to kick your ass in a fight, but you took it pretty well.[/say]")
			_: #fallback
				saynn("[say=kait]I like what I like. And right now, it happens to be you.[/say]")

		saynn("She shrugs sheepishly.")

		saynn("[say=kait]But to be honest, what I really appreciate is that you actually seem to listen to me. I was starting to doubt myself, wondering if I was crazy for wanting to break out of here.[/say]")

		saynn("[say=pc]Of course you're not crazy for wanting that. But I thought you were the boss here?[/say]")

		saynn("[say=kait]I'm not gonna beat around the bush: I'm pretty easy. I like to please my partners. I like feeling useful to other people. I'm not saying I'm gonna be your slave... But maybe, when we're not working, I could be something else for you.[/say]")

		saynn("[say=pc]... And what about the gang? Would I be in charge of that, too?[/say]")

		saynn("[say=kait]Make no mistake, I'm still in charge of planning this whole operation. I've been here a lot longer than you, and I have a lot of ideas. That doesn't make me a dom, though. We can iron out the details as we go, but for now... Would it really be so hard for us to have two different power dynamics at the same time? Gang leader on the streets, loyal pet in the sheets?[/say]")

		addButton("Accept", "Take her up on her bonus offer", "accept")
		addButton("No thanks", "You're not interested in what she's offering", "nothanks")

	if(state == "accept"):
		playAnimation(StageScene.Cuddling, "idle", {npc="kait"})

		saynn("[say=pc]Loyal pet, huh?[/say]")

		saynn("[say=kait]Whatever you wanna call me.[/say]")

		saynn("[say=pc]Cool. But before we forget why we came here... You said you had a plan, boss?[/say]")

		saynn("She flashes a wide smile, her eyes sparkling.")
		
		saynn("[say=kait]Of course I have a plan! Let's get down to business. Are you listening? Here's the plan...[/say]")

		addButton("Listen", "Cue the Mission: Impossible music...", "")


	if(state == "nothanks"):
		saynn("[say=pc]Let's keep things platonic, alright?[/say]")

		saynn("She bites her lip, and sighs.")

		saynn("[say=kait]I understand. It's probably for the best anyway.[/say]")

		saynn("[say=pc]Right... Now, you said you had a plan, boss?[/say]")

		saynn("[say=kait]Of course I have a plan! Let's get down to business. Are you listening? Here's the plan...[/say]")

		addButton("Listen", "Cue the Mission: Impossible music...", "")



func _react(_action: String, _args):
	if(_action == ""):
		aimCamera("solitary_cell")
		setLocationName("Writer's Room")

	if(_action == "accept"):
		increaseModuleFlag("MoonAF26", "kaitFondness", 5)

	if(_action == "whatAreYou"):
		sparklingWater = true

	if(_action == "whyKait"):
		originalJoke = true

	if(_action == "sparklingWater"):
		voiceOfGod = true

	if(_action == "originalJoke"):
		notAFurry = true

	if(_action == "endthescene"):
		setModuleFlag("MoonAF26", "gotBriefed", true)
		endScene()
		return
	
	setState(_action)