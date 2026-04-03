extends EventBase

func _init():
	id = "KaitCellEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_lilac_nearcell")

func run(_triggerID, _args):
	if getModuleFlag("MoonAF26", "startedKaitQuest", false):
		addButton("Kait", "Visit Kait's cell", "visit")

func onButton(_method, _args):
	if(_method == "visit"):
		if not getModuleFlag("MoonAF26", "kaitCellVisited", false):
			runScene("KaitCellScene", ["firstVisit"])
		else:
			runScene("KaitCellScene")