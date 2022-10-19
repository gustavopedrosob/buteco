extends CheckBox

func _ready():
	pressed = Options.options['fullscreen']

func _on_CheckFullscreen_pressed():
	Options.set_fullscreen(!OS.window_fullscreen)
