extends Sprite

var tipos_roupa = ['Camisa','Colete','Joker','Pijama']

func _ready():
	texture = load('res://sprites/Clientes/%s.png' % Functions.get_random_in_list(tipos_roupa))
	modulate = Functions.get_random_color()
