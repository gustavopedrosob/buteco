extends Control

func _ready():
	$VBoxContainer/Load.text = Options.lang_content["load_game"]
	$VBoxContainer/Credits.text = Options.lang_content["credits"]
	$VBoxContainer/Options.text = Options.lang_content["options"]
	$VBoxContainer/Quit.text = Options.lang_content["leave_the_game"]

func _on_Carregar_Jogo_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Saves.tscn")

func _on_Sair_do_jogo_pressed():
	# warning-ignore:return_value_discarded
	get_tree().quit()

func _on_Creditos_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Credits.tscn")

func _on_Opcoes_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/OptionsHomeScreen.tscn")
