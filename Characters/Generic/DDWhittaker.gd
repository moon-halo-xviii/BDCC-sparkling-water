extends Character

func _init():
	id = "director"
	
	pickedSkin="LuxeSkin"
	pickedSkinRColor=Color("ff171717")
	pickedSkinGColor=Color("ff353535")
	pickedSkinBColor=Color("490404")
	npcSkinData={
	"hair": {"r": Color("ff171717"),"g": Color("ff353535"),"b": Color("490404"),},
	"penis": {"skin": "Weiny","g": Color("ff1e1900"),"b": Color("ffffb800"),},
	}
	
func _getName():
	return "Mr. Whittaker"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A wolf with dark fur and a very mean stare."

func getChatColor():
	return "#D8D500"

func getSpecies():
	return ["canine"]

func _getAttacks():
	return ["LuxeIronGrip", "LuxePredatorsRush", "LuxeTauntingSnarl", "LuxeSavageBackhand", "LuxeViciousLunge", "LuxeEnragedSlam", "LuxeBreatheInOut", "trygetupattack"]

func getThickness() -> int:
	return 60

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("manehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = 0
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 30
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("caninetail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["OfficialClothesRed", "plainBriefs"]
