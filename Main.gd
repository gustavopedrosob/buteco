extends Node2D

var velocidade = 500

func _ready():
	if Directory.new().file_exists(Playervariables.get_slot()) == true:
		var dados = Playervariables.load_save()
		var barmanposition = dados['barmanposition']
		$KinematicBody2D.position.x = barmanposition
func _process(delta):
	if Input.is_action_pressed("ui_left") and Playervariables.can_walk == true:
		$KinematicBody2D.move_and_slide(Vector2(-velocidade,0))
	if Input.is_action_pressed("ui_right") and Playervariables.can_walk == true:
		$KinematicBody2D.move_and_slide(Vector2(velocidade,0))
	Playervariables.Barman_x_positon = int($KinematicBody2D.position.x)
