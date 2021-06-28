extends Sprite

var tipos_cabelo = ['Cabelo1','Cabelo2','Cabelo3','Cabelo4']
var cores_comuns = ['#b0a184', '#923f21','#342510','#13120d','#c39b60', '#825b34','#4d2d18','#280200']

func _ready():
	var chance = get_random_int(1, 100)
	texture = load('res://sprites/Clientes/%s.png' % tipos_cabelo[get_random_int(0,3)])
	if chance < 90:
		modulate = Color(cores_comuns[get_random_int(0,7)])
	elif chance > 90:
		modulate = Color(get_random_color(),get_random_color(),get_random_color())

func get_random_int(num1,num2):
	var rand_generate = RandomNumberGenerator.new()
	rand_generate.randomize()
	return rand_generate.randi_range(num1,num2)

func get_random_color():
	var rand_generate = RandomNumberGenerator.new()
	rand_generate.randomize()
	return rand_generate.randf_range(0,1)
