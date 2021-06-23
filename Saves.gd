extends Control
var jogo = "res://Jogo.tscn"
var tela_inicial = "res://Tela Inicial.tscn"
var lista_slots = ['res://slot1','res://slot2','res://slot3','res://slot4']
var SaveI = load("res://classes/SaveI.gd")

func _ready():
	for slot in lista_slots:
		$CenterContainer/VBoxContainer/GridContainer.add_child(SaveI.new(slot))


func _on_Voltar_pressed():
	get_tree().change_scene("res://TelaInicial.tscn")
