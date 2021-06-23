extends CheckBox

func _ready():
	match Options.fullscreen:
		false:
			pressed = false
		true:
			pressed = true
func _on_CheckFullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	Options.fullscreen = !Options.fullscreen
	print(!Options.fullscreen)
	Options.create_save()
