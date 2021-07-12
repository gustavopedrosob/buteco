extends "res://scripts/Options.gd"

func _ready():
	# warning-ignore:return_value_discarded
	$Back.connect("pressed", self, "on_voltar_pressed")

func on_voltar_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/HomeScreen.tscn")
	Options.create_save()
