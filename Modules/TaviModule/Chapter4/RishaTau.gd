extends Character

func _init():
	id = "rishatau"
	#npcLevel = 5
	#npcBasePain = 150
	#npcBaseLust = 120
	npcCharacterType = CharacterType.Generic
	
	npcHasMenstrualCycle = false
	disableSerialization = true
	
	pickedSkin="LuxeSkin"
	pickedSkinRColor=Color("ffa87a59")
	pickedSkinGColor=Color("ffa87a59")
	pickedSkinBColor=Color("ff8f6345")
	npcSkinData={
	"hair": {"r": Color("ff003e6f"),"g": Color("ff113c5e"),"b": Color("ff00335c"),},
	"penis": {"skin": "felinescarred", "g": Color("ffa16954"),},
	"breasts": {"skin": "MonsterGirl", "g": Color("ff604133")}
	}
	
func _getName():
	return "Risha"

func getGender():
	return Gender.Androgynous
	
func getPronounGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A very tall and strong woman with navy blue hair."

func getSpecies():
	return ["feline"]

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

func getDefaultEquipment():
	return ["Leotard"]
