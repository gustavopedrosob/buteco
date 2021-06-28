extends Control

func _ready():
	$"AlinhamentoV/Carregar Jogo".text = Options.lang_content["load_game"]
	$'AlinhamentoV/Creditos'.text = Options.lang_content["credits"]
	$'AlinhamentoV/Opcoes'.text = Options.lang_content["options"]
	$"AlinhamentoV/Sair do jogo".text = Options.lang_content["leave_the_game"]

func _on_Carregar_Jogo_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Saves.tscn")

func _on_Sair_do_jogo_pressed():
	get_tree().quit()

func _on_Creditos_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Creditos.tscn")

func _on_Opcoes_pressed():
	get_tree().change_scene("res://OpcoesTelaInicial.tscn")
