extends CheckBox

func _ready():
	reload_button()

func _on_Autosave_pressed():
	Options.auto_save = !Options.auto_save

func reload_button():
	Options.auto_save = pressed
