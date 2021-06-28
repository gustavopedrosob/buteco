extends Sprite

var tipos_roupa = ['Camisa','Colete','Joker','Pijama']

func _ready():
	texture = load('res://sprites/Clientes/%s.png' % tipos_roupa[get_random_int()])
	modulate = Color(get_random_color(),get_random_color(),get_random_color())

func get_random_int():
	var rand_generate = RandomNumberGenerator.new()
	rand_generate.randomize()
	return rand_generate.randi_range(0,3)

func get_random_color():
	var rand_generate = RandomNumberGenerator.new()
	rand_generate.randomize()
	return rand_generate.randf_range(0,1)
