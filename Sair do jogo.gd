extends Button

func _on_Sair_do_jogo_pressed():
	Playervariables.create_save()
	get_tree().quit()
