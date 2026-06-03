extends Character

func _init():
	id = "thamur"

func _getName():
	return "Colonel Thamur"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A tall, physically imposing dragon with a foreboding presence. Wears formal attire."

func getChatColor():
	return '#9e0200'

func getSpecies():
	return ["dragon"]
	


func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("sockethair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonhorns2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = 0
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("dragonpenis")
	penis.lengthCM = 22
	penis.ballsScale = 1.2
	giveBodypartUnlessSame(penis)
	var tail = GlobalRegistry.createBodypart("dragontail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)

	pickedSkin="WildSkin"
	pickedSkinRColor=Color("396d7c")
	pickedSkinGColor=Color("baf2ef")
	pickedSkinBColor=Color("ffffff")
	npcSkinData={
	"hair": {"r": Color("dcf3ff"),"g": Color("dcf3ff"),"b": Color("dcf3ff"),},
	"ears": {"g": Color("6c4400"), "b": Color("6c4400")},
	"penis": {"g": Color("ffd2160c"),"b": Color("ff8b0000"),},
	}
func getDefaultEquipment():
	return ["OfficialClothesRed", "sportyBriefs", "sportyTankTop"]
