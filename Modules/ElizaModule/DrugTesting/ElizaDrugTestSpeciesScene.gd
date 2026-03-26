extends SceneBase

func _init():
	sceneID = "ElizaDrugTestSpeciesScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("[say=pc]I think you should totally try this one.[/say]")

		saynn("She shakes her head.")

		saynn("[say=eliza]Nope![/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("Her cheeks puff up.")

		saynn("[say=eliza]You don't understand, I have absolutely the worst luck when it comes to these things.[/say]")

		saynn("[say=pc]Maybe today it's gonna be different. C'mon, you can undo it, right?[/say]")

		saynn("Her expression softens.")

		saynn("[say=eliza]I can undo anything.[/say]")

		saynn("[say=pc]So? You might be missing out on something cool.[/say]")

		saynn("She sighs.")

		saynn("[say=eliza]Alright, I'm hopeful.[/say]")

		saynn("She throws the pill into her mouth.. and swallows it.")

		saynn("At first, nothing seems to change.. but then a ripple of warmth begins spreading from her chest through every limb.")

		addButton("Continue", "See what happens next", "dragon_tf")
	if(state == "dragon_tf"):
		playAnimation(StageScene.TFLook, "start", {pc="eliza"})
		saynn("Her skin ripples, shifting into tight, iridescent scales that glint under the sterile, clinical lights. Eliza gasps, pressing her hand to her throat as her mouth tingles.. growing longer and more angular, her lips reshaping into a proud dragon's snout.")

		saynn("She stumbles back, eyes wide as twin horns burst from her forehead, curling backwards, a texture of a polished obsidian. Her ears morph away.. replaced with elegant dragon frills, now poking out from the sides of her head.")

		saynn("Behind her, flesh begins to protrude from the base of her spine, scales creeping along its length as it grows into a powerful, dragon-like tail.. with a tuft of soft, rich fur at the tip.")

		saynn("[say=eliza]Oh, I feel that all the way down in my coccyx![/say]")

		saynn("[say=pc]You're growing one of those, too? And more than one of them?![/say]")

		saynn("[say=eliza]No, {pc.name}, not a... Well, I don't think so?[/say]")

		saynn("Eliza reaches down and tugs her skirt away from her waist, as she pulls up her blouse and reveals her underbelly.. where nearly all of her skin has given way to overlapping scales.")

		saynn("[say=eliza]... No, no cock here. Let alone cocks.[/say]")

		saynn("When the transformation process concludes, Eliza is left panting.. new Eliza.")

		saynn("[say=eliza]You've got to be kidding me.[/say]")

		saynn("Her voice echoes oddly from within her elongated throat.")

		saynn("Her gaze fixates on yours.. her nostrils flaring.. her tail wagging behind her, slapping the expensive equipment left and right.")

		saynn("[say=eliza]..I really wanna test if I can breathe fire. But I care for the lab too much.[/say]")

		saynn("[say=pc]I don't think you look that bad.[/say]")

		saynn("One glare tells you everything.")

		saynn("[say=eliza]I look like a plush toy![/say]")

		saynn("You giggle softly.")

		saynn("[say=pc]Cute plush toy.[/say]")

		saynn("[say=eliza]Will I have to lay eggs now?! Is that how it works?! That just won't do![/say]")

		saynn("She goes back to the chemistry station and begins brewing the same drug again. Her hands swiftly and expertly go through the process.")

		saynn("When that's done, she throws the pill into her mouth, zero deliberation.")

		addButton("Continue", "See what happens next", "feline_tf")
	if(state == "feline_tf"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("A familiar warmth begins to ripple through her bones.")

		saynn("Her horns are first.. those proud obsidian spirals.. shiver and splinter, cracking like falling stalactites before crumbling away.")

		saynn("Eliza gasps as her scales tighten and shimmer, shifting from jewel-like plates to plush white fur. You watch the iridescence bleed out of her limbs, replaced by the soft fuzz. She looks at her new hands, noting the presence of claws.")

		saynn("Her muzzle shortens a bit, the long dragon snout folding back into a feline snout. Eliza stumbles as her jaw realigns, teeth reshaping and sliding into new positions. She touches her face, her brows raising high.")

		saynn("Behind her, the hefty tail's scales vanish, replaced by more fur. What was a massive, powerful tail is now nimbler and more delicate. A pair of equally furry triangular ears sprout atop her head.")

		saynn("Her plantigrade legs change, bones in her calves and feet realign, elevating her stance into the tippy-toed digitigrade posture of a cat. Her toes gain firm padding, resembling little beans. She reflexively bends her knees and ankles, testing the unfamiliar weight distribution...")

		saynn("Looking down, she sees her slender feminine hands, once with delicate nails and skin, replaced by fuzzy fingers. Bending and stretching her digits, she finds them to be just as dextrous as before, but her palms and fingerpads have grown beans, too. Inquisitively, she extends her claws, and then retracts them.")

		saynn("When everything is done, Eliza steps forward curiously, rolling her heel to toe, eyes wide.")

		saynn("[say=eliza]Haha! Wow![/say]")

		saynn("She looks into the datapad, staring at her face from different directions.")

		saynn("[say=pc]How do you feel?[/say]")

		saynn("A wide grin forms on her new face.")

		saynn("[say=eliza]This. Is. [b]Incredible[/b]. Being a dragon was kinda cool, but this?[/say]")

		saynn("She waves her tail behind her admirably, flicking it around, testing how she can move it.")

		saynn("[say=eliza]Amazing. Purely instinctual. Like it was always there.[/say]")

		saynn("[say=pc]So... You're into this sort of thing? Cool.[/say]")

		saynn("Eliza clenches her hands, as if literally trying to grasp for the right words.")

		saynn("[say=eliza]It's strange. It doesn't just feel [b]better[/b]... It feels [b]natural[/b]. I think I look great, too! Not even in a sexy way, just...[/say]")

		saynn("She faces the mirror again. Then, she strikes a pose.")

		saynn("[say=eliza]Well... Maybe it [b]is[/b] in a sexy way~[/say]")

		saynn("She admires herself some more. While watching her reflection, you notice her eyes begin to drift, as if her mind is wandering, pondering.")

		saynn("[say=eliza]I think I might stay like this. I'm serious. What do you think?[/say]")

		addButton("Human", "Change back to a human", "back_to_human")
		addButton("Feline", "Stay as a feline", "stay_feline")

	if(state == "back_to_human"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})

		saynn("[say=pc]I dunno. People might get confused if they're looking for the doctor and they don't know she's a giant cat now. Plus, maybe you'll start shedding. You can always take the pill again, right?[/say]")

		saynn("Eliza sighs.")

		saynn("[say=eliza]You have a point. Do I really wanna deal with that? Not to mention the other potential side-effects of staying like this long-term. That, and whatever Wright would have to say about it. Not that I care what he thinks.[/say]")

		saynn("She mumbles to herself...")

		saynn("[say=eliza]Mom would probably lose it, too...[/say]")

		saynn("She picks up a blue pill, stares at it in her palm for a moment, and quickly gulps it down. Her muzzle morphs back into her familiar lips; her feline ears retreat, as her human ears sprout on the sides of her head; her feet flatten; her tail vanishes; and in an instant, all of her fur is gone. Well, not completely gone: most of it is laying in a pile on the floor all around her.")

		saynn("[say=eliza]Oh, what the hell?! Why did you have to mention shedding?[/say]")

		saynn("[say=pc]I didn't know it would happen like this![/say]")

		saynn("She tugs at the collar of her blouse in discomfort. More fur falls out.")

		saynn("[say=eliza]Aw man, I think I shed inside my clothes, too.[/say]")

		saynn("[say=pc]You should probably go get cleaned up.[/say]")

		saynn("She harrumphs stubbornly.")

		saynn("[say=eliza]I think I'll manage 'til my shift is over. I still have work to do. Lots of work.[/say]")

		saynn("Eliza sits back down at her desk; some more fur gets pushed out of her skirt, with the remaining clumps of hair acting as an uneven cushion. She shifts around in her seat uncomfortably, facing her computer with her hands idling on the keyboard, but not actually doing anything.")

		saynn("[say=eliza]If you don't need anything else, you're free to leave.[/say]")

		addButton("Continue", "See what happens next", "endthescene")

	if(state == "stay_feline"):
		playAnimation(StageScene.Hug, "hug", {npc="eliza"})

		saynn("[say=pc]You seem really happy like this. I don't see why you can't stay this way. And you can always undo it if you need to, right?[/say]")

		saynn("She nods in agreement.")

		saynn("[say=eliza]Yeah... I'm not sure I'll go to staff meetings like this yet. It'd probably be awkward with Mom, too. But as far as I can tell, the risks of long-term transformation are pretty marginal.[/say]")

		saynn("[say=eliza]Do you think other people on the station will be... [b]Into[/b] it?[/say]")

		saynn("It's not like her to be so self-conscious. Does she even know what she's saying?")

		saynn("[say=pc]Oh, I think a [b]lot[/b] of people will be into it. I can barely imagine you staying the way you were just a few minutes ago.[/say]")

		saynn("She chuckles. It's hard to tell under her new fur, but you swear you can see her blush. She laughs harder... Are those tears in her eyes? Before you know it, you're caught in her embrace, warm, firm, and fuzzy.")

		saynn("[say=eliza]That means a lot to me, {pc.name}. Really.[/say]")

		saynn("You hold her for a moment. She whispers to herself:")

		saynn("[say=eliza]Sudden and unusual changes in mood... I'll have to record that.[/say]")

		addButton("Let go", "Eventually, you have to let her get back to work", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "dragon_tf"):
		processTime(3*60)
		setFlag("ElizaModule.elizatf_species", "dragon")
		getCharacter("eliza").updateBodyparts()

	if(_action == "feline_tf"):
		processTime(3*60)
		setFlag("ElizaModule.elizatf_species", "feline")
		getCharacter("eliza").updateBodyparts()

	if(_action == "back_to_human"):
		setFlag("ElizaModule.elizatf_species", "")
		getCharacter("eliza").updateBodyparts()

	if(_action in ["back_to_human", "stay_feline"]):
		processTime(3*60)
		if(!getFlag("ElizaModule.tfcan_species", false)):
			setFlag("ElizaModule.tfcan_species", true)
			addMessage("Eliza can now transform into a dragon or a feline. If you ask her.")

	setState(_action)

func getDevCommentary():
	return "MOON_HALO: Oh, Eliza, why do you have to be so complicated? We love you for it, but it makes it so much harder to write elaborate BDCC shitposts. Not only did I have to rework her unique transformation flags, I had to rewrite half this scene to make it work properly.\n\nI have to admit, rewriting the latter half was a bit of a rollercoaster. It started as a joke, but the scene went in directions I wasn't anticipating. I almost want to stick with this angle and keep developing it... But you know what they say about jokes that go on for too long."