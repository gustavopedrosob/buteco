extends Control
var SaveI = load("res://classes/SaveI.gd")

func _ready():
	for slot in ['res://slot1','res://slot2','res://slot3','res://slot4']:
		$CenterContainer/VBoxContainer/GridContainer.add_child(SaveI.new(slot))

func _on_Voltar_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/TelaInicial.tscn")
