extends Control

func _ready():
	# warning-ignore:return_value_discarded
	$Back.connect("pressed", self, "on_voltar_pressed")

func on_voltar_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/TelaInicial.tscn")
	Options.create_save()
