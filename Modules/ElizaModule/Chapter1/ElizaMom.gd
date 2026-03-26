extends Character

func _init():
	id = "elizaMom"
	npcCharacterType = CharacterType.Generic
	
	pickedSkin="TaviSkin"
	pickedSkinRColor=Color("ffedc68f")
	pickedSkinGColor=Color("ffedc68f")
	pickedSkinBColor=Color("fffff1e2")
	npcSkinData={
	"hair": {"r": Color("ffa76762"),"g": Color("ffff0054"),"b": Color("ffff5bd6"),},
	}
	
	npcHasMenstrualCycle = true
	
func _getName():
	return "Scarlet Quinn"

func getGender():
	return Gender.Female
	
func getChatColor():
	return "#F26AB5"
	
func getSmallDescription() -> String:
	return "An elegant matron with reddish hair. and some small pale marks sprinkled around her medium-fair skin. Has deep eyes of a mature woman. Wears a lab coat"

func getSpecies():
	return ["human"]

func getThickness() -> int:
	return 130

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("bunhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 7
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("plantilegs"))

func getDefaultEquipment():
	return ["LabcoatOutfitAlt", "LaceBra", "LacePanties"]
