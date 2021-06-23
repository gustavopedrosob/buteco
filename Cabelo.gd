extends Sprite

var rand_generate = RandomNumberGenerator.new()
var tipos_cabelo = ['Cabelo1','Cabelo2','Cabelo3','Cabelo4']
var cores_comuns = {'branco':'#b0a184', 'ruivo':'#923f21', 'castanho escuro': '#342510', 'preto':'#13120d','loiro':'#c39b60', 'castanho claro':'#825b34', 'castanho':'#4d2d18','ruivo escuro':'#280200'}
var lista_de_cores_comuns = ['branco','ruivo','castanho escuro','preto','loiro','castanho claro','castanho','ruivo escuro']
var chance

func _ready():
	chance = get_random_int(1,100)
	texture = load(str('res://sprites/Clientes/',tipos_cabelo[get_random_int(0,3)],'.png'))
	if chance < 90:
		modulate = Color(cores_comuns[lista_de_cores_comuns[get_random_int(0,7)]])
	elif chance > 90:
		modulate = Color(get_random_color(),get_random_color(),get_random_color())

func get_random_int(num1,num2):
	rand_generate.randomize()
	return rand_generate.randi_range(num1,num2)
func get_random_color():
	rand_generate.randomize()
	return rand_generate.randf_range(0,1)
