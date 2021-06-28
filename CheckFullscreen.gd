extends CheckBox

func _ready():
	pressed = Options.fullscreen

func _on_CheckFullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	Options.fullscreen = !Options.fullscreen
	Options.create_save()
