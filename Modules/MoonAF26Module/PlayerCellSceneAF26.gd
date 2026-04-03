extends SceneBase

func _init():
	sceneID = "PlayerCellSceneAF26" #Listen, I know there's probably a better way to do this, but I'm pressed for time right now. The punchline isn't a joke.

func _initScene(_args = []):
	addCharacter("kait")
	playAnimation(StageScene.Duo, "walk", {npc="kait"})
	setModuleFlag("MoonAF26", "kaitVisitedPlayerCell", true)

	if "firstVisit" in _args:
		state = "intro"

func _run():
	var kaitFondness = getModuleFlag("MoonAF26", "kaitFondness", 0)

	if(state == ""):
		saynn("type shit")

	if(state in [""]):
		if not getModuleFlag("MoonAF26", "gotBriefed", false):
			addButton("Briefing", "Ask about Kait's escape plan", "briefing")

		addDisabledButton("About Her", "Ask her about herself [Not done yet, I don't even know if Rahi has a backstory for her]")
		addButton("Look Around", "Take a look around the place", "inspect")
		if kaitFondness >= 3:
			addDisabledButton("Sex", "Ask if she's in the mood for sex [Not done yet, ironically]")
		else:
			if kaitFondness <= -20:
				addDisabledButton("Sex?", "You're delusional")
			elif kaitFondness <= -10:
				addDisabledButton("Sex?", "She's REALLY not interested in you")
			else:
				addDisabledButton("Sex?", "She's not interested in you")

		addButton("Leave", "type shit", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)