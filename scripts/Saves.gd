extends Control
var SaveI = load("res://classes/SaveI.gd")

func _ready():
	# warning-ignore:return_value_discarded
	Options.connect("language_change", self, "update_language")
	update_language()
	for slot in range(1, 5):
		$CenterContainer/VBoxContainer/GridContainer.add_child(SaveI.new(slot))

func update_language():
	$CenterContainer/VBoxContainer/Back.text = Options.lang_content["back"]

func _on_Voltar_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/HomeScreen.tscn")
