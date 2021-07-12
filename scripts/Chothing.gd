extends Sprite

var clothes = ['Camisa','Colete','Joker','Pijama']

func _ready():
	texture = load('res://sprites/Clientes/%s.png' % Functions.get_random_in_list(clothes))
	modulate = Functions.get_random_color()
