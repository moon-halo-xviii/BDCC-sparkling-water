extends Attack

var aimHitLoc = null

func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical, customAccuracyMult = 1.5, _optionalVerb = "shoot")):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical, customDodgeMult = 0.3)):
		var randomText = RNG.pick([
		"{_receiver.name} narrowly rolled away from the shot!",
		])
		
		return {
			text = randomText,
			dodged = true,
		}

	getBodypartToHit()

	var text = "{_attacker.name} shoots {_receiver.name}'s "+HitLoc.getName(aimHitLoc)+"."

	var damage = RNG.randi_range(90, 100)
	var damageMult = 1

	var roll = randf()
	match aimHitLoc:
		HitLoc.Head:
			if roll <= 0.7:
				_receiver.addEffect(DDRef.Dying)
				text += " It's a killshot."
				damage = _receiver.painThreshold()
				damageMult = 6
			elif roll <= 0.9:
				_receiver.addEffect(DDRef.Bleed, [aimHitLoc, "Gunshot Wound", [damage/3]])
				text += " Somehow, {_receiver.he} seems to still be alive."
			else:
				damageMult = 0.25
				text += " But it only grazed {_receiver.his} skull!"
		HitLoc.Chest:
			if roll <= 0.6:
				_receiver.addEffect(DDRef.Bleed, [aimHitLoc, "Gunshot Wound", [damage/6]])
			elif roll <= 0.97:
				damageMult = 0.25
				text += " It only grazes the flesh."
			else:
				_receiver.addEffect(DDRef.Dying)
				text += " It's a killshot."
				damage = _receiver.painThreshold()
				damageMult = 6
		HitLoc.ArmLeft:
			if roll <= 0.2:
				damageMult = 0.25
				text += " It only grazes the flesh."
			else:
				_receiver.addEffect(DDRef.Bleed, [aimHitLoc, "Gunshot Wound", [damage/6]])
				if roll > 0.8:
					if _receiver.addEffect(DDRef.FractureArm, [HitLoc.ArmLeft]):
						text += " {_receiver.His} left arm gets fractured!"
		HitLoc.ArmRight:
			if roll <= 0.2:
				damageMult = 0.25
				text += " It only grazes the flesh."
			else:
				_receiver.addEffect(DDRef.Bleed, [aimHitLoc, "Gunshot Wound", [damage/6]])
				if roll > 0.8:
					if _receiver.addEffect(DDRef.FractureArm, [HitLoc.ArmRight]):
						text += " {_receiver.His} right arm gets fractured!"
		HitLoc.LegLeft:
			if roll <= 0.2:
				damageMult = 0.25
				text += " It only grazes the flesh."
			else:
				_receiver.addEffect(DDRef.Bleed, [aimHitLoc, "Gunshot Wound", [damage/6]])
				if roll > 0.65:
					if _receiver.addEffect(DDRef.FractureLeg, [HitLoc.LegLeft]):
						text += " {_receiver.His} left leg gets fractured!"
		HitLoc.LegRight:
			if roll <= 0.2:
				damageMult = 0.25
				text += " It only grazes the flesh."
			else:
				_receiver.addEffect(DDRef.Bleed, [aimHitLoc, "Gunshot Wound", [damage/6]])
				if roll > 0.65:
					if _receiver.addEffect(DDRef.FractureLeg, [HitLoc.LegRight]):
						text += " {_receiver.His} right leg gets fractured!"

	return {
		text = text,
		pain = damage*damageMult,
	}

func setBodypartToHit(hitloc):
	aimHitLoc = hitloc

func getBodypartToHit(_receiver):
	aimHitLoc = RNG.pickWeighted([HitLoc.Head, HitLoc.Chest, HitLoc.ArmLeft, HitLoc.ArmRight, HitLoc.LegLeft, HitLoc.LegRight], [5, 45, 12.5, 12.5, 12.5, 12.5])
	
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

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 0.05

func getAttackerDamageMultiplierEfficiency(_attacker, _receiver, _damageType) -> float:
	return 0.0