extends Control

func _ready():
	if Options.dicas and Playervariables.dicas["movimento"]:
		$CenterContainer/AnimationPlayer/Dica.text = 'Dica: aperte A e D para se mover.'
		$Timer.start()
	else:
		visible = false

func on_animation_finished(animation):
	if animation == "Fadeout":
		visible = false
		Playervariables.dicas["movimento"] = false

func on_timeout():
	$CenterContainer/AnimationPlayer.play("Fadeout")
