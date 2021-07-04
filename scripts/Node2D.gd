extends Node2D

var clicks_required = 0
var times_pressed = 0

const possible_clicks_required = [25, 35, 50]

func _ready():
	clicks_required = possible_clicks_required[Options.dificulty]
	$Alinhamento/Dica.text = Options.lang_content["click_on_beer"] % clicks_required

# warning-ignore:unused_argument
func _process(delta):
	$Alinhamento/Time.text = str(Options.lang_content["time_left"], int($Timer.time_left))

func _on_TextureButton_pressed():
	$AnimationPlayer.stop()
	var multiplier = 100.0/float(clicks_required)
	if times_pressed < clicks_required:
		times_pressed += 1
		$AnimationPlayer/QntPrecionado.visible = true
		$Alinhamento/TextureButton/TextureProgress.value = times_pressed * multiplier
		$AnimationPlayer/QntPrecionado.rect_position = get_global_mouse_position() - Vector2(25,25)
		$AnimationPlayer.play("Fade")
	$AnimationPlayer/QntPrecionado.text = str(times_pressed)
	# Aqui executa se conseguir os clicks necessarios
	if times_pressed == clicks_required:
		Playervariables.set_game_2(3)
		Playervariables.set_yield()
		queue_free()

func get_multiplier():
	var percentage = (times_pressed * 100)/clicks_required
	var multiplier = (3.0 * percentage)/100.0
	return multiplier

func _on_Timer_timeout():
	if times_pressed:
		Playervariables.game_2 = get_multiplier()
		Playervariables.set_yield()
		queue_free()
	else:
		Playervariables.clear_yield()
		queue_free()
	
