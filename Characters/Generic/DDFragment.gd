extends Character

func _init():
	id = "fragment"

func _getName():
	return "Fragment"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A creature of your own making."

func getChatColor():
	return '#0a1109'

func getSpecies():
	return ["feline"]

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("baldhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 3
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("felinetail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	
	pickedSkin="CunningSkin"
	pickedSkinRColor=Color("0a1109")
	pickedSkinGColor=Color("0a1109")
	pickedSkinBColor=Color("0a1109")
