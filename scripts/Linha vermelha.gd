extends Control

var results = []
var velocity = 0

# warning-ignore:unused_signal
signal hit
# warning-ignore:unused_signal
signal missed

const speeds = [1.5, 2.0, 2.5]
var state = 'rising'

func _ready():
	velocity = speeds[Options.dificulty]

# warning-ignore:unused_argument
func _process(delta):
	if $"Linha branca".rect_position.y <= 195 and state == 'rising':
		$"Linha branca".rect_position.y += velocity
		if $"Linha branca".rect_position.y >= 195:
			state = 'down'
	elif $"Linha branca".rect_position.y >= 0 and state == 'down':
		$"Linha branca".rect_position.y -= velocity
		if $"Linha branca".rect_position.y <= 0:
			state = 'rising'

func _unhandled_input(event):
	if event.is_action_pressed("ui_select"):
		if $"Linha branca".rect_position.y >= $"Linha verde".rect_position.y and $"Linha branca".rect_position.y <= $"Linha verde".rect_position.y + $"Linha verde".rect_size.y:
			hit(true, 'hit')
		else:
			hit(false, 'missed')


func set_random_green_line():
	$"Linha verde".rect_position.y = Functions.get_random_int(5, 195)

func reset_white_line():
	$"Linha branca".rect_position.y = 0

func reset_and_set():
	reset_white_line()
	set_random_green_line()

func hit(result, sinal):
	results.append(result)
	emit_signal(sinal)
	check_if_end()
	reset_and_set()

func get_sum():
	var sum = results.count(false) + results.count(true)
	return sum

func check_if_end():
	if get_sum() == 3:
		var how_many_true = results.count(true)
		Playervariables.set_game_1(how_many_true)
		get_parent().get_parent().queue_free()
		Playervariables.busy = false
