extends Node2D

var can_interact = false
var can_interact_2 = false
var already_interact = false
var drinks = []

onready var line = preload("res://scenes/Linhas.tscn").instance()
onready var click = preload("res://scenes/Jogodosclick.tscn").instance()
onready var barmannode = get_node('/root/Node/Bar/KinematicBody2D/barman')
onready var sound_of_hitting = load('res://Songs/Acertou.wav')
onready var sound_of_miss = load('res://Songs/Errou.wav')

func _ready():
	for x in range(1, 5):
		drinks.append(load("res://sprites/Bebida %d.png" % x))
	line.connect("tree_exited", self, '_on_Linha_tree_exited')
	click.connect("tree_exited", self,'_on_Jogoclick_tree_exited')
	line.get_child(1).connect('hit', self, 'on_hit')
	line.get_child(1).connect('missed', self, 'on_missed')
	$AnimationPlayer.current_animation = 'Entrada'
	$AnimationPlayer.play("Entrada")
	
	var possible_drink_value = [10, 20, 30, 40]
	var rand_beb = Functions.get_random_int(0, 3)
	Playervariables.drink_value = possible_drink_value[rand_beb]
	var rand_pos = Functions.get_random_int(100, 800)
	$"AnimationPlayer/posicao/Cliente/Pedido do cliente/Pedido".set_texture(drinks[rand_beb])
	$'AnimationPlayer/posicao'.position.x = rand_pos

func _unhandled_input(event):
	if event.is_action_pressed("interagir") and can_interact and not already_interact and can_interact_2:
		$"AnimationPlayer/posicao/Cliente/Pedido do cliente".visible = false
		already_interact = true
		# cliente é filho do spawner
		get_parent().get_parent().add_child(line)
		# o primeiro get_parent é o spawner o segundo é o Node principal
		Playervariables.can_walk = false
		barmannode.texture = barmannode.mixology
		Playervariables.busy = true
		$Inatividade.stop()
		Playervariables.anti_pause = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'Entrada':
		$"AnimationPlayer/posicao/Cliente/Pedido do cliente".visible = true
		can_interact_2 = true
	if anim_name == 'Saida':
		queue_free()

func _on_Linha_tree_exited():
	var spawnernode = get_parent().get_parent().get_node("Spawner")
	get_parent().get_parent().add_child_below_node(spawnernode, click)
	barmannode.texture = barmannode.serving
	Playervariables.anti_pause = false
func _on_Jogoclick_tree_exited():
	$AnimationPlayer.play("Saida")
	barmannode.texture = barmannode.normal
	Playervariables.can_walk = true
func _on_Inatividade_timeout():
	$"AnimationPlayer/posicao/Cliente/Pedido do cliente".visible = false
	$AnimationPlayer.play("Saida")

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
