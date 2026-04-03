extends Character

func _init():
	id = "moon"
	disableSerialization = true
	
func _getName():
	return "MOON_HALO"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "The author of this module"

func getSpecies():
	return ["human"]

