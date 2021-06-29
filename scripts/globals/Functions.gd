extends Node

func get_random_int(num1, num2):
	var rand_generate = RandomNumberGenerator.new()
	rand_generate.randomize()
	return rand_generate.randi_range(num1, num2)

func get_random_float(num1, num2):
	var rand_generate = RandomNumberGenerator.new()
	rand_generate.randomize()
	return rand_generate.randf_range(num1, num2)

func get_random_color():
	return Color(get_random_float(0, 1), get_random_float(0, 1), get_random_float(0, 1))
	
func get_random_in_list(list):
	var size = len(list)
	return list[get_random_int(0, size - 1)]
