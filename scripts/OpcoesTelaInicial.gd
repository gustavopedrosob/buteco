extends Control

func _ready():
	$CenterContainer/VBoxContainer/Voltar.connect("pressed", self, "on_voltar_pressed")
func on_voltar_pressed():
	get_tree().change_scene("res://TelaInicial.tscn")
