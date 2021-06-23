extends Control

onready var savesscene = "res://Saves.tscn"
onready var creditosscene = "res://Creditos.tscn"
onready var opcoesscene = "res://OpcoesTelaInicial.tscn"

onready var carregarjogo = $"AlinhamentoV/Carregar Jogo"
onready var creditos = $'AlinhamentoV/Creditos'
onready var opcoes = $'AlinhamentoV/Opcoes'
onready var sairdojogo = $"AlinhamentoV/Sair do jogo"

func _ready():
	match Options.language:
		'pt-br':
			carregarjogo.text = 'Carregar Jogo'
			creditos.text = 'Creditos'
			opcoes.text = 'Opções'
			sairdojogo.text = 'Sair do Jogo'
		'en-us':
			carregarjogo.text = 'Load game'
			creditos.text = 'Credits'
			opcoes.text = 'Options'
			sairdojogo.text = 'Leave the game'
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
