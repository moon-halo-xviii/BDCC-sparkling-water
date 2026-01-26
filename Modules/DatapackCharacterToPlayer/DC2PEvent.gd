extends EventBase

func _init():
	id = "DC2PEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SceneAndStateHook, ["CharacterCreatorScene", ""])
	es.addTrigger(self, Trigger.SceneAndStateHook, ["CharacterCreatorScene", "pickgender"])

func run(_triggerID, _args):
	GM.main.clearMessages()
	addMessage("Want to import a datapack character instead? Select \"IMPORT\"")
	GM.ui.addButtonAt(14,"Import", "Start DatapackCharacterToPlayer", "EVENTSYSTEM_BUTTON", [self, "DC2P", []])

func onButton(_method, _args):
	if(_method == "DC2P"):
		runScene("DC2PScene", [], "")
