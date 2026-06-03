extends Character

func _init():
	id = "policeofficer1"
	disableSerialization = true
	
func _getName():
	return "Police Officer"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A gruff, tall wolf with a scar on his left cheek. Wears a police officer uniform and a high-tech bulletproof vest."

func getSpecies():
	return [Species.Canine]
