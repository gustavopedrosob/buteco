extends Control
var SaveI = load("res://classes/SaveI.gd")

func _ready():
	for slot in range(1, 5):
		$CenterContainer/VBoxContainer/GridContainer.add_child(SaveI.new(slot))

func _on_Voltar_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/TelaInicial.tscn")
