extends VBoxContainer

var ButtonB = load("res://classes/Button.gd")
var LabelB = load("res://classes/Label.gd")
var negative_texture = load("res://sprites/Buttons/negativo.png")

class_name SaveI

func _init(slot):
	var slot_label = LabelB.new() 
	slot_label.text = "Slot"
	var hboxcontainer = HBoxContainer.new()
	hboxcontainer.name = "HBoxContainer"
	var save_button = ButtonB.new()
	save_button.name = "SaveButton"
	var delete_button = Button.new()
	delete_button.rect_min_size = Vector2(20, 20)
	delete_button.set_focus_mode(Control.FOCUS_NONE)
	var delete_stylebox = StyleBoxTexture.new()
	delete_stylebox.texture = negative_texture
	for mode in ["normal", "hover"]:
		delete_button.set("custom_styles/%s" % mode, delete_stylebox)
	delete_button.name = "DeleteButton"
	save_button.connect("button_down", self, "on_save_pressed", [slot])
	delete_button.connect("button_down", self, "on_delete_pressed", [slot])
	# set language
	if Directory.new().file_exists(slot):
		save_button.text = Options.lang_content["load"]
	else:
		save_button.text = Options.lang_content["new_game"]
		delete_button.visible = false
	add_child(slot_label)
	add_child(hboxcontainer)
	hboxcontainer.add_child(save_button)
	hboxcontainer.add_child(delete_button)


func on_save_pressed(slot):
	Playervariables.slot = slot
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Jogo.tscn")


func on_delete_pressed(slot):
	# warning-ignore:return_value_discarded
	Directory.new().remove(slot)
	$HBoxContainer/SaveButton.text = Options.lang_content["new_game"]
	$HBoxContainer/DeleteButton.visible = false
