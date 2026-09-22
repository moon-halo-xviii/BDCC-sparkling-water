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
		GM.pc.addEffect(DDRef.Bleed, [[HitLoc.Chest, "Debug", 3]])
	if(_method == "applyEffect2"):
		GM.pc.addEffect(DDRef.FractureRib)
		GM.pc.addEffect(DDRef.FractureArm, [HitLoc.ArmLeft, HitLoc.ArmRight])
		GM.pc.addEffect(DDRef.FractureLeg, [HitLoc.LegLeft, HitLoc.LegRight])
