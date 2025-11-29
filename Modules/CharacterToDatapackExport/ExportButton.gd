extends EventBase

func _init():
	id = "ExportButton"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SceneAndStateHook, ["MeScene", ""])

func run(_triggerID, _args):
	addButton("Export", "Export a character to a datapack", "startExport")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "startExport"):
		runScene("ExportMenu")
