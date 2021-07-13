extends Control

func _ready():
	# warning-ignore:return_value_discarded
	$Options/Back.connect("pressed", self, "_on_options_back_pressed")
	# warning-ignore:return_value_discarded
	Options.connect("language_change", self, "update_language")
	update_language()

func update_language():
	$Pause/Title.text = Options.lang_content["game_paused"]
	$Pause/Options.text = Options.lang_content["options"]
	$Pause/SaveAndQuit.text = Options.lang_content["save_and_leave"]
	$Pause/Save.text = Options.lang_content["save"]
	$Pause/ReturnToHomeScreen.text = Options.lang_content["return_to_home_screen"]

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		if get_tree().paused:
			get_tree().paused = false
			$Pause.visible = true
			$Options.visible = false
			visible = false
		else:
			get_tree().paused = true
			visible = true

func _on_save_pressed():
	Playervariables.create_save()

func _on_quit_pressed():
	Playervariables.create_save()
	get_tree().quit()

func _on_back_to_homescreen_pressed():
	Playervariables.reset_vars()
	get_tree().paused = false
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/HomeScreen.tscn")

func _on_options_pressed():
	$Pause.visible = false
	$Options.visible = true

func _on_options_back_pressed():
	$Options.visible = false
	$Pause.visible = true
	Options.create_save()
