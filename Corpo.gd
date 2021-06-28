extends Sprite

func _ready():
	var tons_de_pele = ['f7d2be','eebea3','eab99a','efba9b','d99573','de9a75','a0563a']
	modulate = Color(tons_de_pele[get_random_int()])

func get_random_int():
	var rand_generate = RandomNumberGenerator.new()
	rand_generate.randomize()
	return rand_generate.randi_range(0,6)
