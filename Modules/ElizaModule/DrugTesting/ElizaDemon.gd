extends Character

func _init():
	id = "elizaDemon"

	disableSerialization = true

	pickedSkin="ArconSkin"
	pickedSkinRColor=Color("fffee5c2")
	pickedSkinGColor=Color("fffff4f5")
	pickedSkinBColor=Color("ffd39666")
	npcSkinData={
	"head": {"skin": "FurGirl",},
	"hair": {"r": Color("ffce74af"),"g": Color("fff1c0e0"),"b": Color("ff46460d"),},
	"ears": {"r": Color("ffd6aac7"),"g": Color("ffdb6b74"),},
	"horns": {"r": Color("ffbd64a5"),"g": Color("ffebc57d"),"b": Color("ff9e0081"),},
	"tail": {"r": Color("ffc25994"), "g": Color("ffeb7dbb"), "b": Color("ffebc57d")},
	"legs": {"skin": "LuxeSkin","g": Color("ffeb7dbb"), "b": Color("ffc25994")},
	}
	
func _getName():
	return "Eliza Quinn"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "An elegant woman with pink hair. Wears a lab coat and carries quite a few medical tools on her belt. Oh, and she's a demon now, too."

func getSpecies():
	return ["human", "demon"]

func getThickness() -> int:
	return 90

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ponytailhair2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("demonhorns2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("demontail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("hoofs"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 6
	giveBodypartUnlessSame(breasts)

func getDefaultEquipment():
	return ["LabcoatOutfit", "LaceBra", "LacePanties", "ElizaNecklace"]
	#return []
