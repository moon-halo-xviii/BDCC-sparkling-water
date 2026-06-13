extends EventBase

func _init():
	id = "DD_StatusEffectTestEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SceneAndStateHook, ["WorldScene", ""])
	
func run(_triggerID, _args):
	addButton("BLEED", "StatusEffectTest", "applyEffect")
	addButton("FRACTURE", "StatusEffectTest", "applyEffect2")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "applyEffect"):
		GM.pc.addEffect(DDStatusEffect.Bleed, [10])
	if(_method == "applyEffect2"):
		GM.pc.addEffect(DDStatusEffect.FractureRib)
		GM.pc.addEffect(DDStatusEffect.FractureArm)
		GM.pc.addEffect(DDStatusEffect.FractureLeg)