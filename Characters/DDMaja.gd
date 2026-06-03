extends Character

func _init():
	id = "maja"
	disableSerialization = true
	
func _getName():
	return "Maja Archaki"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Elegant-looking lynx with beige fur. She wears formal attire."

func getSpecies():
	return [Species.Feline]

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("longhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("lynxears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 5
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("shorttail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))


	pickedSkin="LynxSkin"
	pickedSkinRColor="c09952"
	pickedSkinBColor="ffffff"
	pickedSkinGColor="ffffff"
	npcSkinData={
	"hair": {"r": Color("000000"),"g": Color("3b0067"),"b": Color("3b0067"),}
	}
func getChatColor():
	return "#50C878"

func getDefaultEquipment():
	return ["OfficialClothes", "LaceBra", "LacePanties",]
