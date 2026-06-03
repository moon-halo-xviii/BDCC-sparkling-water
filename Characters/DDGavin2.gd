extends Character

func _init():
	id = "ddgavin"
	
	npcLevel = 75
	npcBasePain = 900
	npcBaseLust = 999
	npcBaseStamina = 900
	npcCharacterType = CharacterType.Guard
	
	npcArmor = {
		DamageType.Physical: 50,
		DamageType.Lust: 75,
		DamageType.Stamina: 50,
	}
	npcRestraintStrugglePower = 3
	npcBaseRestraintDodgeChanceMult = 1.5
	
	pickedSkin="CunningSkin"
	pickedSkinRColor=Color("ffe07a35")
	pickedSkinGColor=Color("ffe7e7e7")
	pickedSkinBColor=Color("ff512c13")
	npcSkinData={
	"ears": {"b": Color("ffffffff"),},
	"arms": {"g": Color("ff070707"),},
	"penis": {"g": Color("ffd2160c"),"b": Color("ff8b0000"),},
	"legs": {"g": Color("ff070707"),},
	"hair": {"r": Color("ff090909"),"g": Color("ff1f1f1f"),"b": Color("ff090909"),},
	}
	
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.ReallyDislikes,
		InterestTopic.Bodywritings: Interest.ReallyDislikes,
		InterestTopic.Gags: Interest.Dislikes,
		InterestTopic.Blindfolds: Interest.SlightlyDislikes,
		InterestTopic.ButtPlugs: Interest.SlightlyDislikes,
		InterestTopic.VaginalPlugs: Interest.KindaLikes,
		InterestTopic.FeminineBody: Interest.Loves,
		InterestTopic.AndroBody: Interest.ReallyLikes,
		InterestTopic.MasculineBody: Interest.SlightlyDislikes,
		InterestTopic.ThickBody: Interest.Hates,
		InterestTopic.AverageMassBody: Interest.Likes,
		InterestTopic.SlimBody: Interest.Loves,
		InterestTopic.ThickButt: Interest.Likes,
		InterestTopic.AverageButt: Interest.ReallyLikes,
		InterestTopic.NoBreasts: Interest.SlightlyDislikes,
		InterestTopic.SmallBreasts: Interest.KindaLikes,
		InterestTopic.MediumBreasts: Interest.ReallyLikes,
		InterestTopic.BigBreasts: Interest.Loves,
		InterestTopic.LactatingBreasts: Interest.Hates,
		InterestTopic.StuffedPussy: Interest.Dislikes,
		InterestTopic.StuffedAss: Interest.Dislikes,
		InterestTopic.StuffedPussyOrAss: Interest.Hates,
		InterestTopic.Pregnant: Interest.Dislikes,
		InterestTopic.StuffedThroat: Interest.Dislikes,
		InterestTopic.CoveredInCum: Interest.ReallyDislikes,
		InterestTopic.CoveredInLotsOfCum: Interest.Hates,
		InterestTopic.FullyNaked: Interest.Loves,
		InterestTopic.ExposedPussy: Interest.Loves,
		InterestTopic.ExposedAnus: Interest.Loves,
		InterestTopic.ExposedBreasts: Interest.Loves,
		InterestTopic.ExposedCock: Interest.Loves,
		InterestTopic.ExposedPanties: Interest.Likes,
		InterestTopic.ExposedBra: Interest.Likes,
		InterestTopic.LooseAnus: Interest.Dislikes,
		InterestTopic.LoosePussy: Interest.Dislikes,
		InterestTopic.TightAnus: Interest.KindaLikes,
		InterestTopic.TightPussy: Interest.ReallyLikes,
		InterestTopic.HasVaginaOnly: Interest.Loves,
		InterestTopic.HasVaginaAndCock: Interest.Likes,
		InterestTopic.BigCock: Interest.Dislikes,
		InterestTopic.AverageCock: Interest.Likes,
		InterestTopic.SmallCock: Interest.ReallyLikes,
	}
	
func _getName():
	return "Gavin Pearson"

func _getGender():
	return Gender.Male

func getSmallDescription() -> String:
	return "A tall male fox with dark red eyes. He wears very formal clothing with a trenchcoat. He constantly has a sadistic expression on his face."
	
func getSpecies():
	return ["canine"]

func getChatColor():
	return "#880808"

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("messyhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 22
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("foxtail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	
func getDefaultEquipment():
	return ["OfficialTrenchcoatRed", "sportyBriefs", "sportyTankTop",]

func _getAttacks():
	return ["VitalShot", "KneeStrike", "DisablingShot", "MachineSpray", "TakeAim", "Phase", "GavinKick", "GavinKnife", "BolaThrow", "trygetupattack"]
