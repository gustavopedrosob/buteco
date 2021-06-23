extends Sprite

var rand_generate = RandomNumberGenerator.new()
var tons_de_pele = ['f7d2be','eebea3','eab99a','efba9b','d99573','de9a75','a0563a']

func _ready():
	modulate = Color(str(tons_de_pele[get_random_int()]))
func get_random_int():
	rand_generate.randomize()
	return rand_generate.randi_range(0,6)
