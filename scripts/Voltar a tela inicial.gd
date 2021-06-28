extends Button

func _on_Voltar_a_tela_inicial_pressed():
	Playervariables.reset_vars()
	get_tree().paused = false
	get_tree().change_scene("res://scenes/TelaInicial.tscn")
