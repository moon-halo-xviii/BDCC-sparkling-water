extends Character

func _init():
	id = "phone"
	disableSerialization = true
	
func _getName():
	return "Phone"

func getGender():
	return Gender.Androgynous
	
func getSmallDescription() -> String:
	return "The phone given to you by the police officer."

func getSpecies():
	return [Species.Unknown]
	
func getChatColor():
	return '#65e52c'
