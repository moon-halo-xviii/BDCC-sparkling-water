#Might be better off used in the Dying interaction, but we'll use this for now.

extends SceneBase

func _init():
	sceneID = "DD_DeathScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Rekt, "end", {npc="pc"})
		saynn("You feel the strength leave your body as what was left of your vision fades. You feel yourself slip away into the ethereal, escaping this pain forevermore...")
		saynn("[color=#ff0000]GAME OVER - Load a save.[/color]")