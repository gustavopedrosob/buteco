extends Control

var times_played = 0
var points = 0
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
	if $WhiteLine.rect_position.y <= 195 and state == 'rising':
		$WhiteLine.rect_position.y += velocity
		if $WhiteLine.rect_position.y >= 195:
			state = 'down'
	elif $WhiteLine.rect_position.y >= 0 and state == 'down':
		$WhiteLine.rect_position.y -= velocity
		if $WhiteLine.rect_position.y <= 0:
			state = 'rising'

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
