extends Module

func _init():
	id = "BDCCDD_ASSETS"
	author = "MOON_HALO / Sumobear50"

	attacks = [
		"res://Modules/BDCCDD_ASSETS/Attacks/Core/GunAttack.gd",
		"res://Modules/BDCCDD_ASSETS/Attacks/Core/BladeAttack.gd",
		"res://Modules/BDCCDD_ASSETS/Attacks/Core/BluntAttack.gd",
		"res://Modules/BDCCDD_ASSETS/Attacks/Basic/BasicBluntAttack.gd",
	]

	items = [
		"res://Modules/BDCCDD_ASSETS/Items/Clothes/BDMSP_JumpsuitOrange/BDMSP_Jumpsuit.gd",
		"res://Modules/BDCCDD_ASSETS/Items/Clothes/BDMSP_JumpsuitLilac/BDMSP_JumpsuitLilac.gd",
		"res://Modules/BDCCDD_ASSETS/Items/Clothes/BDMSP_JumpsuitRed/BDMSP_Jumpsuit.gd",
		"res://Modules/BDCCDD_ASSETS/Items/Clothes/OfficialTrenchcoat/OfficialTrenchcoat.gd",
		"res://Modules/BDCCDD_ASSETS/Items/Clothes/OfficialTrenchcoatRed/OfficialTrenchcoatRed.gd",

		"res://Modules/BDCCDD_ASSETS/Items/Medicine/Bandage.gd",
		"res://Modules/BDCCDD_ASSETS/Items/Medicine/Suture.gd",
		"res://Modules/BDCCDD_ASSETS/Items/Medicine/Splint.gd",
		"res://Modules/BDCCDD_ASSETS/Items/Medicine/ChestBrace.gd",

		"res://Modules/BDCCDD_ASSETS/Items/Weapons/TestPistol.gd",
		"res://Modules/BDCCDD_ASSETS/Items/Weapons/TestBlade.gd",
		"res://Modules/BDCCDD_ASSETS/Items/Weapons/TestBat.gd",
	]

	events = [
		"res://Modules/BDCCDD_ASSETS/DEBUG/StatusEffectTestEvent.gd",
	]

	scenes = [
		"res://Modules/BDCCDD_ASSETS/StatusEffect/DeathScene.gd",
		"res://Modules/BDCCDD_ASSETS/Scenes/Game/DDMedicineScene.gd",
	]

	statusEffects = [
		"res://Modules/BDCCDD_ASSETS/StatusEffect/BleedV2.gd",
		"res://Modules/BDCCDD_ASSETS/StatusEffect/Bruise.gd",
		"res://Modules/BDCCDD_ASSETS/StatusEffect/Dying.gd",
		"res://Modules/BDCCDD_ASSETS/StatusEffect/FractureArm.gd",
		"res://Modules/BDCCDD_ASSETS/StatusEffect/FractureLeg.gd",
		"res://Modules/BDCCDD_ASSETS/StatusEffect/FractureRib.gd",
		"res://Modules/BDCCDD_ASSETS/StatusEffect/Headache.gd",
	]


