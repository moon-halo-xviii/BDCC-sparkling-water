extends "res://Modules/BDCCDD_ASSETS/Attacks/Core/BluntAttack.gd"

func _init():
	id = "DD_BasicBluntAttack"
	category = Category.Physical
	isWeaponAttack = true

func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)

	var text = "{attacker.name} swings the bat at {receiver.name}"

	var damageRange = [0,0]

	var item = getItem(_context)
	if(item != null):
		damageRange = item.getDamageRange()

	return {
		text = text,
		pain = RNG.randi_range(damageRange[0], damageRange[1]),
	}

func getAttackSoloAnimation():
	return "stunbaton"

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands, "UsableArm"]

func checkRequirement(_attacker, _receiver, req):
	var reqtype = req[0]
	match reqtype:
		AttackRequirement.FreeArms:
			if(_attacker.hasBoundArms()):
				return false
		AttackRequirement.FreeHands:
			if(_attacker.hasBlockedHands()):
				return false
		"UsableArm":
			if(_attacker.hasEffect(DDRef.FractureArm)):
				var fractures = _attacker.getEffect(DDRef.FractureArm).getAfflictedHitLocs()
				if HitLoc.ArmLeft in fractures  && fractures.fracRight in fractures:
					return false

	return true

func getRequirementText(req):
	var reqtype = req[0]
	if(reqtype == AttackRequirement.FreeArms):
		return "Arms must be free"
	if(reqtype == AttackRequirement.FreeHands):
		return "Hands must be free"
	if(reqtype == "UsableArm"):
		return "At least one arm must be usable"

	return "Error: bad requirement:" + reqtype
