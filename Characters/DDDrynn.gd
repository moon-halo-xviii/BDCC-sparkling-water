extends Character

func _init():
	id = "drynn"
	disableSerialization = true
	
func _getName():
	return "Drynn Ma'tak"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A gruff, glowing dragon with a serious expression. Wears a guard outfit."

func getSpecies():
	return [Species.Dragon]

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("manehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonhorns"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = 0
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("dragonpenis")
	penis.lengthCM = 30
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("dragontail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))


	pickedSkin="GeometricSkin"
	pickedSkinRColor="792323"
	pickedSkinBColor="792323"
	pickedSkinGColor="b87100"
	npcSkinData={
	"hair": {"r": Color("000000"),"g": Color("b87100"),"b": Color("b87100"),}
	}

func getDefaultEquipment():
	return ["GuardArmor", "sportyTankTop", "sportyBriefs",]

func getChatColor():
	return "#FF6600"
