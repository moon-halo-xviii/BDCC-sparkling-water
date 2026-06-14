extends SceneBase

var uniqueItemID = ""

func _init():
	sceneID = "DD_MedicineScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]

func _reactInit():
	if(uniqueItemID == null || uniqueItemID == ""):
		return
	var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
	
	match item.id:
		DDRef.Bandage:
			setState("bandage")
		_:
			setState("")

func _run():
	if(state == ""):
		#Something went wrong
		addButton("Continue", "You shouldn't be here", "endthescene")
	
	#Test implementation, the final implementation needs to be applicable to specific bodyparts
	if(state == "bandage"):
		if GM.pc.hasEffect(DDRef.Bleed):
			var bleed = GM.pc.getEffect(DDRef.Bleed)
			GM.pc.getInventory().getItemByUniqueID(uniqueItemID).removeXOrDestroy(1)
			bleed.woundSeverity -= 20
			if bleed.woundSeverity <= 0:
				GM.pc.removeEffect(DDRef.Bleed)
				saynn("You used the bandage on your wound. The bleeding stopped.")
			else:
				if bleed.woundSeverity < 5:
					saynn("You used the bandage on your wound. It's still bleeding a little.")
				elif bleed.woundSeverity < 15:
					saynn("You used the bandage on your wound. It's still bleeding quite a bit, though.")
				else:
					saynn("You tried using the bandage on your wound. It isn't very effective.")
			addButton("Continue", "Get on your way", "endthescene")
		else:
			saynn("You don't have any wounds to treat.")
			addButton("Continue", "Okay", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func saveData():
	return {
		"uID": uniqueItemID,
	}

func loadData(_data):
	uniqueItemID = SAVE.loadVar(_data, "uID", "")
