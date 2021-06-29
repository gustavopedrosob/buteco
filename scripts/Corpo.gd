extends Sprite

func _ready():
	var tons_de_pele = ['f7d2be','eebea3','eab99a','efba9b','d99573','de9a75','a0563a']
	modulate = Color(Functions.get_random_in_list(tons_de_pele))
