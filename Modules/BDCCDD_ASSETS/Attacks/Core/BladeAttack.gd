extends Attack

var aimHitLoc = null

func _init():
	id = "DD_BladeAttack"
	isWeaponAttack = true

func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	getBodypartToHit(_receiver)

	var damageRange = [0,0]

	var item = getItem(_context)
	if(item != null):
		damageRange = item.getDamageRange()

	var attackVerb = ["slashes", "Laceration"]

	var damage = RNG.randi_range(damageRange[0], damageRange[1])

	if randf() <= 0.33:
		damage *= 2
		attackVerb = ["stabs", "Stab Wound"]

	var text = "{_attacker.name} {attack_verb} {_receiver.name}'s {hitloc}.".format({"attack_verb":attackVerb[0], "hitloc":HitLoc.getName(aimHitLoc)})

	_receiver.addEffect(DDRef.Bleed, [[aimHitLoc, attackVerb[1], damage/6]])

	return {
		text = text,
		pain = damage,
	}

func setBodypartToHit(hitloc):
	aimHitLoc = hitloc

func getBodypartToHit(_receiver):
	if _receiver.isBlocking():
			aimHitLoc = RNG.pickWeighted([HitLoc.Chest, HitLoc.ArmLeft, HitLoc.ArmRight, HitLoc.LegLeft, HitLoc.LegRight], [15, 65, 65, 20, 20])
	else:
			aimHitLoc = RNG.pickWeighted([HitLoc.Head, HitLoc.Chest, HitLoc.ArmLeft, HitLoc.ArmRight, HitLoc.LegLeft, HitLoc.LegRight], [15, 45, 20, 20, 20, 20])
	
	return aimHitLoc

func calcDamage(_attacker, _receiver, _damageType, _damage: int) -> int:
	var damageMult = _attacker.getDamageMultiplier(_damageType) * getAttackerDamageMultiplierEfficiency(_attacker, _receiver, _damageType)
	if(isWeaponAttack):
		damageMult += GM.pc.getCustomAttribute(BuffAttribute.MeleeWeaponsDamage)
	if(_damage < 0):
		damageMult = -damageMult

	if _receiver.hasEffect(DDRef.Bruise):
		if aimHitLoc in _receiver.getEffect(DDRef.Bruise).bruises:
			damageMult += 0.1		

	return int(round(_damage * (1.0 + damageMult)))

func getAttackSoloAnimation():
	return "shiv"

func getVisibleName(_context = {}):
	var item = getItem(_context)
	if(item == null):
		return "error"
	
	return item.getVisibleName()
	
func getVisibleDesc(_context = {}):
	var item = getItem(_context)
	if(item == null):
		return "error"
	
	return item.getVisisbleDescription()

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
