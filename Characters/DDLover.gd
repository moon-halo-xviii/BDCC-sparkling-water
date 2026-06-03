extends Character

func _init():
	id = "DDAnya"
	
	npcLevel = 50
	npcBasePain = 415
	npcBaseLust = 215
	npcBaseStamina = 500
	npcCharacterType = CharacterType.Inmate

	pickedSkin="DappledSkin"
	pickedSkinRColor=Color("3d1700")
	pickedSkinGColor=Color("6a3717")
	pickedSkinBColor=Color("230d00")
	npcSkinData={"hair": {"r": Color("1c0a00"),"g": Color("1c0a00"),"b": Color("3f0268"),},
	}
	
func _getName():
	return "Anya Borisonova"

func _getGender():
	return Gender.Female

func getSmallDescription() -> String:
	return "An average size female chocolate lab with soft blue eyes. She wears a inmate uniform, and smells like flowers!"
	
func getSpecies():
	return ["canine"]

func getChatColor():
	return "#253fce"
	
func getDefaultEquipment():
	return ["BDMSP_JumpsuitOrange", "plainPanties", "plainBra", "inmatecollar",]


func getThickness() -> int:
	return 75

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("kidlathair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("bulldogears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 4
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("huskytail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
