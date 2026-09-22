extends Attack

var aimHitLoc = null

func doAttack(_attacker, _receiver, _context = {}):
	doRequirements(_attacker, _receiver)
	var result = _doAttack(_attacker, _receiver, _context)
	if(result is String):
		result = {text="!OLD STYLE!"+result}
	elif(!result.has("text")):
		result["text"] = "!No attack text provided!"
	
	result["attackerAnimation"] = getAttackSoloAnimation()
	result["receiverAnimation"] = getAttackHitReactAnimation(_attacker, _receiver, result)
	
	if(result.has("pain")):
		getBodypartToHit(_receiver)
		result["pain"] = calcDamage(_attacker, _receiver, DamageType.Physical, result["pain"])
		var origDamage = result["pain"]
		result["pain"] = _receiver.receiveDamage(DamageType.Physical, result["pain"], getRecieverArmorScaling(_attacker, _receiver, DamageType.Physical))
		result["text"] += " "+receiverDamageMessageShort(DamageType.Physical, result["pain"], origDamage)
	if(result.has("lust")):
		result["lust"] = calcDamage(_attacker, _receiver, DamageType.Lust, result["lust"])
		var origDamage = result["lust"]
		result["lust"] = _receiver.receiveDamage(DamageType.Lust, result["lust"], getRecieverArmorScaling(_attacker, _receiver, DamageType.Lust))
		result["text"] += " "+receiverDamageMessageShort(DamageType.Lust, result["lust"], origDamage)
	if(result.has("stamina")):
		result["stamina"] = calcDamage(_attacker, _receiver, DamageType.Stamina, result["stamina"])
		var origDamage = result["stamina"]
		result["stamina"] = _receiver.receiveDamage(DamageType.Stamina, result["stamina"], getRecieverArmorScaling(_attacker, _receiver, DamageType.Stamina))
		result["text"] += " "+receiverDamageMessageShort(DamageType.Stamina, result["stamina"], origDamage)
	
	if(result.has("pain")): #DD injury infliction
		result["text"] += " "+bluntInjury(_receiver, result["pain"])

	return result

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

func bluntInjury(_receiver, netDamage):	
	var painRemaining:float = _receiver.painThreshold() - _receiver.getPain() + netDamage

	var injuryReport: Array = []

	var inj = randf()
	
	var a1 = netDamage-painRemaining/3
	
	var threshold = (1+(a1)/(10+abs(a1)))/2

	if inj <= threshold:
		_receiver.addEffect(DDRef.Bruise, [aimHitLoc])
		injuryReport.append("{_receiver.name}'s "+HitLoc.getName(aimHitLoc)+" is getting pretty bruised.")

	var a2 = netDamage/float(_receiver.painThreshold())

	match aimHitLoc:
		HitLoc.Head:
			var roll = randf()
			if roll <= pow(a2,2)-0.25:
				_receiver.addEffect(DDRef.Dying)
				injuryReport.append("You hear {_receiver.his} skull crack from the force of the blow!")
			elif _receiver.getPain() >= _receiver.painThreshold():
				_receiver.addConsciousness(-1.0)
				injuryReport.append("{_receiver.He} is knocked out from the blow to {_receiver.his} head!")
			elif roll <= pow(a2,2):
				_receiver.addEffect(StatusEffect.Stunned)
				injuryReport.append("{_receiver.He} is reeling from a strong blow to the head!")
		HitLoc.Chest:
			if randf() <= pow(a2,2):
				_receiver.addEffect(DDRef.FractureRib)
				injuryReport.append("You hear {_receiver.his} ribs crack from the force of the blow!")
		HitLoc.ArmLeft:
			if randf() <= pow(a2,2):
				_receiver.addEffect(DDRef.FractureArm, [HitLoc.ArmLeft])
				injuryReport.append("You hear {_receiver.his} left arm crack from the force of the blow!")
		HitLoc.ArmRight:
			if randf() <= pow(a2,2):
				_receiver.addEffect(DDRef.FractureArm, [HitLoc.ArmRight])
				injuryReport.append("You hear {_receiver.his} right arm crack from the force of the blow!")
		HitLoc.LegLeft:
			if randf() <= pow(a2,2):
				_receiver.addEffect(DDRef.FractureLeg, [HitLoc.LegRight])
				injuryReport.append("You hear {_receiver.his} left leg crack from the force of the blow!")
		HitLoc.LegRight:
			if randf() <= pow(a2,2):
				_receiver.addEffect(DDRef.FractureLeg, [HitLoc.LegRight])
				injuryReport.append("You hear {_receiver.his} right leg crack from the force of the blow!")
		_:
			return "ERROR: Attack tried to hit a bad bodypart"
			
	print(_receiver.getName()+" hit in "+HitLoc.getName(aimHitLoc))

	return " ".join(injuryReport)
