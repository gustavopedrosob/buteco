extends Control

onready var savesscene = "res://Saves.tscn"
onready var creditosscene = "res://Creditos.tscn"
onready var opcoesscene = "res://OpcoesTelaInicial.tscn"

onready var carregarjogo = $"AlinhamentoV/Carregar Jogo"
onready var creditos = $'AlinhamentoV/Creditos'
onready var opcoes = $'AlinhamentoV/Opcoes'
onready var sairdojogo = $"AlinhamentoV/Sair do jogo"

func _ready():
	carregarjogo.text = Options.lang_content["load_game"]
	creditos.text = Options.lang_content["credits"]
	opcoes.text = Options.lang_content["options"]
	sairdojogo.text = Options.lang_content["leave_the_game"]

func _on_Carregar_Jogo_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene(savesscene)

func _on_Sair_do_jogo_pressed():
	get_tree().quit()

func _on_Creditos_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene(creditosscene)

func _on_Opcoes_pressed():
	get_tree().change_scene(opcoesscene)
