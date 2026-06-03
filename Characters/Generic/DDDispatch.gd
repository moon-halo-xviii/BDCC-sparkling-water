extends Character

func _init():
	id = "dispatch"
	disableSerialization = true
	
func _getName():
	return "Dispatch"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A woman who is typically heard over the radio."

func getSpecies():
	return [Species.Feline]
