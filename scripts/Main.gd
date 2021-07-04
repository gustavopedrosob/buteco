extends Node2D

func _ready():
	if Directory.new().file_exists(Playervariables.get_slot()):
		var dados = Playervariables.load_save()
		var barmanposition = dados['barmanposition']
		$KinematicBody2D.position.x = barmanposition

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_pressed("ui_left") and Playervariables.can_walk:
		$KinematicBody2D.move_and_slide(Vector2(-500, 0))
	if Input.is_action_pressed("ui_right") and Playervariables.can_walk:
		$KinematicBody2D.move_and_slide(Vector2(500, 0))
	Playervariables.Barman_x_positon = $KinematicBody2D.position.x
