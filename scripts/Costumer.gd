extends Node2D

var can_interact = false
var can_interact_2 = false
var already_interact = false

onready var line = preload("res://scenes/LineGame.tscn").instance()
onready var click = preload("res://scenes/ClickGame.tscn").instance()
onready var barmannode = get_node('/root/Game/Pub/KinematicBody2D/Barman')
onready var sound_of_hitting = load('res://Songs/Acertou.wav')
onready var sound_of_miss = load('res://Songs/Errou.wav')

func _ready():
	$Audio.volume_db = (Options.volume - 100) * 0.8
	line.connect("tree_exited", self, '_on_Linha_tree_exited')
	click.connect("tree_exited", self,'_on_Jogoclick_tree_exited')
	line.get_child(1).connect('hit', self, 'on_hit')
	line.get_child(1).connect('missed', self, 'on_missed')
	$AnimationPlayer.play("Entry")
	
	var possible_drink_value = [10, 20, 30, 40]
	var rand_beb = Functions.get_random_int(0, 3)
	Playervariables.drink_value = possible_drink_value[rand_beb]
	var rand_pos = Functions.get_random_int(100, 800)
	$Drink.set_texture(load("res://sprites/drinks/%d.png" % (rand_beb + 1)))
	position.x = rand_pos

func _unhandled_input(event):
	if event.is_action_pressed("interagir") and can_interact and not already_interact and can_interact_2:
		already_interact = true
		# cliente é filho do spawner
		Functions.add_and_move_child(get_node("/root/Game"), line, 3)
		# o primeiro get_parent é o spawner o segundo é o Node principal
		Playervariables.can_walk = false
		barmannode.texture = barmannode.mixology
		Playervariables.busy = true
		$Inactivity.stop()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'Entry':
		can_interact_2 = true
	if anim_name == 'Exit':
		queue_free()

func _on_Linha_tree_exited():
	Functions.add_and_move_child(get_node("/root/Game"), click, 3)
	barmannode.texture = barmannode.serving

func _on_Jogoclick_tree_exited():
	$AnimationPlayer.play("Exit")
	barmannode.texture = barmannode.normal
	Playervariables.can_walk = true

func _on_Inatividade_timeout():
	$AnimationPlayer.play("Exit")

# warning-ignore:unused_argument
func _on_Area2D_body_entered(body):
	can_interact = true
# warning-ignore:unused_argument
func _on_Area2D_body_exited(body):
	can_interact = false
	
func on_hit():
	$Audio.stream = sound_of_hitting
	$Audio.play()

func on_missed():
	$Audio.stream = sound_of_miss
	$Audio.play()
