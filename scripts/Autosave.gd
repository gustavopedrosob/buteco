extends CheckBox

func _ready():
	pressed = Options.options['auto-save']

func _on_Autosave_pressed():
	Options.auto_save = !Options.auto_save
