extends Sprite

func _ready():
	texture = load('res://sprites/costumer/clothing/%s.png' % Functions.get_random_int(1, 4))
	modulate = Functions.get_random_color()
