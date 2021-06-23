extends Node2D

var rand_generate = RandomNumberGenerator.new()

var pode_interagir = false
var pode_interagir2 = false
var ja_interagiu = false

var bebida1 = load("res://sprites/Bebida 1.png")
var bebida2 = load("res://sprites/Bebida 2.png")
var bebida3 = load("res://sprites/Bebida 3.png")
var bebida4 = load("res://sprites/Bebida 4.png")
var listabebidas = [bebida1,bebida2,bebida3,bebida4]

onready var Pedido = $"AnimationPlayer/posicao/Cliente/Pedido do cliente/Pedido"
onready var PedidoCliente = $"AnimationPlayer/posicao/Cliente/Pedido do cliente"
onready var Posicao = $'AnimationPlayer/posicao'
onready var linha = preload("res://Linhas.tscn").instance()
onready var jogoclick = preload("res://Jogodosclick.tscn").instance()
onready var barmannode = get_parent().get_parent().get_node(NodePath('Bar/KinematicBody2D/barman'))
onready var som_acertou_linha = load('res://Songs/Acertou.wav')
onready var som_errou_linha = load('res://Songs/Errou.wav')

func _ready():
	linha.connect("tree_exited", self, '_on_Linha_tree_exited')
	jogoclick.connect("tree_exited", self,'_on_Jogoclick_tree_exited')
	linha.get_child(0).get_child(1).connect('acertou', self, 'on_acertou')
	linha.get_child(0).get_child(1).connect('errou', self, 'on_errou')
	
	$AnimationPlayer.current_animation = 'Entrada'
	$AnimationPlayer.play("Entrada")
	
	rand_generate.randomize()
	var rand_beb = rand_generate.randi_range(0,3)
	match rand_beb:
		0:
			Playervariables.valor_da_bebida = 10
		1:
			Playervariables.valor_da_bebida = 20
		2:
			Playervariables.valor_da_bebida = 30
		3:
			Playervariables.valor_da_bebida = 40
	var rand_pos = rand_generate.randi_range(100,800)
	
	Pedido.set_texture(listabebidas[rand_beb])
	Posicao.position.x = rand_pos
# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("interagir") and pode_interagir == true and ja_interagiu == false and pode_interagir2 == true:
		PedidoCliente.visible = false
		ja_interagiu = true
		# cliente é filho do spawner
		get_parent().get_parent().add_child(linha)
		# o primeiro get_parent é o spawner o segundo é o Node principal
		Playervariables.can_walk = false
		barmannode.texture = barmannode.mixologia
		Playervariables.esta_ocupado = true
		$Inatividade.stop()
		Playervariables.antipause = true
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'Entrada':
		PedidoCliente.visible = true
		pode_interagir2 = true
	if anim_name == 'Saida':
		queue_free()
func _on_Linha_tree_exited():
	var spawnernode = get_parent().get_parent().get_node(NodePath("Spawner"))
	get_parent().get_parent().add_child_below_node(spawnernode,jogoclick)
	barmannode.texture = barmannode.servindo
	Playervariables.antipause = false
func _on_Jogoclick_tree_exited():
	$AnimationPlayer.play("Saida")
	barmannode.texture = barmannode.normal
	Playervariables.can_walk = true
func _on_Inatividade_timeout():
	PedidoCliente.visible = false
	$AnimationPlayer.play("Saida")

# warning-ignore:unused_argument
func _on_Area2D_body_entered(body):
	pode_interagir = true
# warning-ignore:unused_argument
func _on_Area2D_body_exited(body):
	pode_interagir = false
	
func on_acertou():
	$Audio.stream = som_acertou_linha
	$Audio.play()
func on_errou():
	$Audio.stream = som_errou_linha
	$Audio.play()
