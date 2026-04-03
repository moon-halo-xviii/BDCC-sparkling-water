extends EventBase

func _init():
	id = "PlayerCellEventAF26"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringPlayerCell)

func run(_triggerID, _args):
	var startedQuest = getModuleFlag("MoonAF26", "startedKaitQuest", false)
	var kaitLikesYou = (getModuleFlag("MoonAF26", "kaitFondness", 0) > 0)
	if (false && startedQuest && kaitLikesYou): #disabled
		addButton("Kait", "Call Kait over for a visit", "visit")

func onButton(_method, _args):
	if(_method == "visit"):
		if not getModuleFlag("MoonAF26", "kaitVisitedPlayerCell", false):
			runScene("PlayerCellScene", ["firstVisit"])
		else:
			runScene("PlayerCellScene")