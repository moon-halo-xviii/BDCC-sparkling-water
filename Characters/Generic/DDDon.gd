extends Character

func _init():
	id = "don"
	disableSerialization = true
	
func _getName():
	return "The Don"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A tired looking middle-aged golden retriever. Has the look of a teacher who deals with too much shit."

func getSpecies():
	return [Species.Canine]
	
func getChatColor():
	return '#5bb9e2'

func getThickness() -> int:
	return 30

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 18
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("bulldogears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var tail = GlobalRegistry.createBodypart("huskytail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("baldhair"))

	pickedSkinRColor="f6d774"
	pickedSkinBColor="f6d774"
	pickedSkinGColor="f6d774"
