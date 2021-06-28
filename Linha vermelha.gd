extends Control

var lista_resultados = []
onready var velocidade = 0

signal acertou
signal errou

var estado = 'subindo'

func _ready():
	match Options.dificuldade:
		'facil':
			velocidade = 1.5
		'normal':
			velocidade = 2.0
		'dificil':
			velocidade = 2.5
# warning-ignore:unused_argument
func _process(delta):
	if $"Linha branca".rect_position.y <= 195 and estado == 'subindo':
		$"Linha branca".rect_position.y += velocidade
		if $"Linha branca".rect_position.y >= 195:
			estado = 'descendo'
	elif $"Linha branca".rect_position.y >= 0 and estado == 'descendo':
		$"Linha branca".rect_position.y -= velocidade
		if $"Linha branca".rect_position.y <= 0:
			estado = 'subindo'
	if Input.is_action_just_pressed("ui_select"):
		if $"Linha branca".rect_position.y >= $"Linha verde".rect_position.y and $"Linha branca".rect_position.y <= $"Linha verde".rect_position.y + $"Linha verde".rect_size.y:
			acertou(true,'acertou')
		else:
			acertou(false,'errou')

func set_random_green_line():
	var rand_generate = RandomNumberGenerator.new() 
	rand_generate.randomize()
	var rand_int = rand_generate.randi_range(5,195)
	$"Linha verde".rect_position.y = rand_int

func reset_white_line():
	$"Linha branca".rect_position.y = 0

func reset_and_set():
	reset_white_line()
	set_random_green_line()

func acertou(result,sinal):
	lista_resultados.append(result)
	emit_signal(sinal)
	checa_se_acabou()
	reset_and_set()

func get_soma():
	var soma = lista_resultados.count(false) + lista_resultados.count(true)
	return soma

func checa_se_acabou():
	if get_soma() == 3:
		var quantos_trues = lista_resultados.count(true)
		Playervariables.set_jogo1(quantos_trues)
		get_parent().get_parent().queue_free()
		Playervariables.esta_ocupado = false
