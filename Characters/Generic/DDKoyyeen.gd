extends Character

func _init():
	id = "koyyeen"
	disableSerialization = true
	
func _getName():
	return "Lyrica Vanillin"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A casually dressed hyena who smells a lot like coffee."

func getSpecies():
	return [Species.Canine]
	
func getChatColor():
	return '#9c6f44'

func getThickness() -> int:
	return 30

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 18
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("simplehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var tail = GlobalRegistry.createBodypart("caninetail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	
	pickedSkin="SocketSkin"
	pickedSkinRColor="e5a657"
	pickedSkinBColor="4c393d"
	pickedSkinGColor="4c393d"
	
	npcSkinData={
	"hair": {"r": Color("4c393d"),"g": Color("4c393d"),"b": Color("4c393d"),},
	}
