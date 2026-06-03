extends Character

func _init():
	id = "rebecca"

func _getName():
	return "Rebecca Taylor"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A very short emotionally disarming fennec who radiates a happy, calming presence. Wears fancy medical attire."

func getChatColor():
	return '#FFC4D1'

func getSpecies():
	return ["canine"]

func getThickness() -> int:
	return 25

func getFemininity() -> int:
	return 75

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fennechead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ponytailhair4"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fennecears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 2
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	var tail = GlobalRegistry.createBodypart("fennectail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	pickedSkin="SocketSkin"
	pickedSkinRColor=Color("7c359b")
	pickedSkinGColor=Color("decbe5")
	pickedSkinBColor=Color("9d6db1")
	npcSkinData={
	"hair": {"r": Color("5c1900"),"g": Color("5c1900"),"b": Color("ffee5b"),},
	}
func getDefaultEquipment():
	return ["LabcoatOutfit", "LaceBra", "LacePanties"]
