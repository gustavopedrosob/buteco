extends Sprite

var rand_generate = RandomNumberGenerator.new()
var tipos_roupa = ['Camisa','Colete','Joker','Pijama']

func _ready():
	texture = load(str('res://sprites/Clientes/',tipos_roupa[get_random_int()],'.png'))
	modulate = Color(get_random_color(),get_random_color(),get_random_color())
#func _process(delta):
#	pass
func get_random_int():
	rand_generate.randomize()
	return rand_generate.randi_range(0,3)
func get_random_color():
	rand_generate.randomize()
	return rand_generate.randf_range(0,1)
