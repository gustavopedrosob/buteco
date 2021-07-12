extends Sprite

func _ready():
	var skin_tones = ['f7d2be','eebea3','eab99a','efba9b','d99573','de9a75','a0563a']
	modulate = Color(Functions.get_random_in_list(skin_tones))
