extends Control

func _ready():
	if Options.tips and Playervariables.tips["movimento"]:
		$CenterContainer/AnimationPlayer/Label.text = 'Dica: aperte A e D para se mover.'
		$Timer.start()
	else:
		visible = false

func on_animation_finished(animation):
	if animation == "Fadeout":
		visible = false
		Playervariables.tips["movimento"] = false

func on_timeout():
	$CenterContainer/AnimationPlayer.play("Fadeout")
