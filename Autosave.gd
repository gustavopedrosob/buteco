extends CheckBox

func _ready():
	reload_button()

func _on_Autosave_pressed():
	Options.auto_save = !Options.auto_save
	Options.create_save()

func reload_button():
	match Options.auto_save:
		true:
			pressed = true
		false:
			pressed = false
