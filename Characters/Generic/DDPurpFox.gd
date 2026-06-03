extends Character

func _init():
	id = "purpfox"
	disableSerialization = true
	
func _getName():
	return "Jacqueline"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "An elegant looking purple fox."

func getSpecies():
	return [Species.Canine]
	
func getChatColor():
	return '#6C3BAA'

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("foxhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("longhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears3"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 4
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("foxtail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

	pickedSkin="CunningSkin"
	pickedSkinRColor="990099"
	pickedSkinBColor="990099"
	pickedSkinGColor="D3D3D3"
	
	npcSkinData={
	"hair": {"r": Color("967bb6"),"g": Color("967bb6"),"b": Color("967bb6"),},
	"arms": {"g": Color("4D004D"),},
	"legs": {"g": Color("4D004D"),},
	}
