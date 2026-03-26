extends Character

func _init():
	id = "rishaIntro"
	npcLevel = 1
	npcBasePain = 100
	npcBaseLust = 80
	npcCharacterType = CharacterType.Guard
	
	pickedSkin="LuxeSkin"
	pickedSkinRColor=Color("ffa87a59")
	pickedSkinGColor=Color("ffa87a59")
	pickedSkinBColor=Color("ff8f6345")
	npcSkinData={
	"hair": {"r": Color("ff003e6f"),"g": Color("ff113c5e"),"b": Color("ff00335c"),},
	"penis": {"skin": "felinescarred", "g": Color("ffa16954"),"b": Color("ffc9c9c9"),},
	"breasts": {"skin": "MonsterGirl", "g": Color("ff604133")}
	}
	
func _getName():
	return "Risha"

func getGender():
	return Gender.Androgynous
	
func getPronounGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A very tall and strong woman with navy blue hair. Usually wears her bulky guard armor. Has a huge amount of facial piercings"

func getSpecies():
	return ["human"]

func _getAttacks():
	return ["aitaunthumiliate", "stunbatonAttack", "stunbatonStrongAttack", "biteattack", "simplekickattack", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	return getName() + " eyes you out and licks her lips.\n\n"+("[say=risha]You're an easy prey for me. Why don't you just undress and we can have some fun instead~[/say]")+"\n\nRisha then gets into a combat stance and gestures you to come closer. Her heavy armor doesn't seem to impact her mobility one bit, her hand holds the stun baton very tightly\n\nSeems the first move is yours"

func getThickness() -> int:
	return 110

func getFemininity() -> int:
	return 70

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("plantilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("overeyehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 8
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("felinepenis")
	penis.lengthCM = 22
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))

func getParentCharacterID():
	return "risha"

func getDefaultEquipment():
	return ["GuardArmor", "HumanPiercings"]
