extends Control

var times_played = 0
var points = 0
var velocity = 0

# warning-ignore:unused_signal
signal hit
# warning-ignore:unused_signal
signal missed

const speeds = [1.5, 2.0, 2.5]
var down = true

func _ready():
	velocity = speeds[Options.options['difficulty']]

# warning-ignore:unused_argument
func _process(delta):
	move_white_line(-velocity if down else +velocity)
	if is_line_at_bottom():
		down = false
	elif is_line_at_top():
		down = true

func is_line_at_bottom():
	return $WhiteLine.rect_position.y <= 0

func is_line_at_top():
	return $WhiteLine.rect_position.y >= 195

func move_white_line(position):
	$WhiteLine.rect_position.y += position

func _unhandled_input(event):
	if event.is_action_pressed("ui_select"):
		if $WhiteLine.rect_position.y >= $GreenLine.rect_position.y and $WhiteLine.rect_position.y <= $GreenLine.rect_position.y + $GreenLine.rect_size.y:
			hit(true, 'hit')
		else:
			hit(false, 'missed')

func set_random_green_line():
	$GreenLine.rect_position.y = Functions.get_random_int(5, 195)

func reset_white_line():
	$WhiteLine.rect_position.y = 0

func reset_and_set():
	reset_white_line()
	set_random_green_line()

func hit(result, sinal):
	if result:
		points += 1
	times_played += 1
	emit_signal(sinal)
	check_if_end()
	reset_and_set()

func check_if_end():
	if times_played == 3:
		Playervariables.game_1 = points
		get_parent().queue_free()
		Playervariables.busy = false
