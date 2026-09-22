extends Attack

var aimHitLoc = null

func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	getBodypartToHit(_receiver)

	var damage = RNG.randi_range(20,40)

	var attackVerb:String

	if randf() <= 0.33:
		damage *= 2
		attackVerb = ["stabs", "Stab Wound"]
	else:
		attackVerb = ["slashes", "Laceration"]


	var text = "{_attacker.name} %s {_receiver.name}'s %s.".format([attackVerb[0], HitLoc.getName(aimHitLoc)])

	_receiver.addEffect.(DDRef.Bleed, [aimHitLoc, attackVerb[1], damage/6])

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
