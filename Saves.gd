extends Control
var jogo = "res://Jogo.tscn"
var tela_inicial = "res://Tela Inicial.tscn"

onready var save1 = $"CenterContainer/VBoxContainer/GridContainer/HBoxContainer/Save 1"
onready var save2 = $"CenterContainer/VBoxContainer/GridContainer/HBoxContainer2/Save 2"
onready var save3 = $"CenterContainer/VBoxContainer/GridContainer/HBoxContainer3/Save 3"
onready var save4 = $"CenterContainer/VBoxContainer/GridContainer/HBoxContainer4/Save 4"
onready var deleta1 = $"CenterContainer/VBoxContainer/GridContainer/HBoxContainer/Deleta1"
onready var deleta2 = $"CenterContainer/VBoxContainer/GridContainer/HBoxContainer2/Deleta2"
onready var deleta3 = $"CenterContainer/VBoxContainer/GridContainer/HBoxContainer3/Deleta3"
onready var deleta4 = $"CenterContainer/VBoxContainer/GridContainer/HBoxContainer4/Deleta4"
#var slot1 = 'res://slot1'
#var slot2 = 'res://slot2'
#var slot3 = 'res://slot3'
#var slot4 = 'res://slot4'
onready var lista_saves = [save1,save2,save3,save4]
var lista_slots = ['res://slot1','res://slot2','res://slot3','res://slot4']
onready var lista_deletes = [deleta1,deleta2,deleta3,deleta4]
onready var voltar = $CenterContainer/VBoxContainer/Voltar

func _ready():
	for x in range(4):
		change_title(lista_slots[x],lista_saves[x])
		check_delete(lista_slots[x],lista_deletes[x])
func change_title(slot,savenumber):
	voltar.text = Options.lang_content["back"]
	match Directory.new().file_exists(slot):
		false:
			savenumber.text = Options.lang_content["new_game"]
		true:
			savenumber.text = Options.lang_content["load"]
func create_or_load(slot):
	match Directory.new().file_exists(slot):
		false:
			Playervariables.set_slot(slot)
			get_tree().change_scene(jogo)
		true:
			Playervariables.set_slot(slot)
			get_tree().change_scene(jogo)
func _on_Save_1_pressed():
	create_or_load(lista_slots[0])
func _on_Save_2_pressed():
	create_or_load(lista_slots[1])
func _on_Save_3_pressed():
	create_or_load(lista_slots[2])
func _on_Save_4_pressed():
	create_or_load(lista_slots[3])
func check_delete(slot,deletenumber):
	match Directory.new().file_exists(slot):
		false:
			deletenumber.visible = false
		true:
			deletenumber.visible = true
func save_delete(slot,savenumber,deletenumber):
	Directory.new().remove(slot)
	change_title(slot,savenumber)
	check_delete(slot,deletenumber)
func _on_Deleta1_pressed():
	save_delete(lista_slots[0],save1,deleta1)

func _on_Deleta2_pressed():
	save_delete(lista_slots[1],save2,deleta2)

func _on_Deleta3_pressed():
	save_delete(lista_slots[2],save3,deleta3)

func _on_Deleta4_pressed():
	save_delete(lista_slots[3],save4,deleta4)

func _on_Voltar_pressed():
	get_tree().change_scene("res://TelaInicial.tscn")
