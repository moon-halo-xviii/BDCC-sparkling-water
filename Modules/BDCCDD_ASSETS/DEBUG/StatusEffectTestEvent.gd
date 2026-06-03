extends EventBase

func _init():
	id = "DD_StatusEffectTestEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SceneAndStateHook, ["WorldScene", ""])
	
func run(_triggerID, _args):
	addButton("EFFECT", "StatusEffectTest", "applyEffect")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "applyEffect"):
		GM.pc.addEffect(DDStatusEffect.Bleed, [10])