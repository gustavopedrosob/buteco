extends Sprite

var tipos_cabelo = ['Cabelo1','Cabelo2','Cabelo3','Cabelo4']
var cores_comuns = ['#b0a184', '#923f21','#342510','#13120d','#c39b60', '#825b34','#4d2d18','#280200']

func _ready():
	var chance = Functions.get_random_int(1, 100)
	texture = load('res://sprites/Clientes/%s.png' % Functions.get_random_in_list(tipos_cabelo))
	if chance < 90:
		modulate = Color(Functions.get_random_in_list(cores_comuns))
	elif chance > 90:
		modulate = Functions.get_random_color()
