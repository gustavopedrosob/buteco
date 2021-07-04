extends Button

func _on_Voltar_a_tela_inicial_pressed():
	Playervariables.reset_vars()
	get_tree().paused = false
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/TelaInicial.tscn")
