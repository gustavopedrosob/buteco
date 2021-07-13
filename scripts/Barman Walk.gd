extends Node2D

func _ready():
	print("just testing")
	if Directory.new().file_exists(Playervariables.slot):
		var save = Playervariables.load_save()
		var barman_position = save['position']
		$KinematicBody2D.position.x = barman_position

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_pressed("ui_left") and Playervariables.can_walk:
		$KinematicBody2D.move_and_slide(Vector2(-500, 0))
	if Input.is_action_pressed("ui_right") and Playervariables.can_walk:
		$KinematicBody2D.move_and_slide(Vector2(500, 0))
	Playervariables.positon = $KinematicBody2D.position.x
