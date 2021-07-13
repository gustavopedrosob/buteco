extends VBoxContainer

var close = load("res://sprites/interface/Close.png")

class_name SaveI

func _init(slot: int):
	var slot_label = Label.new() 
	slot_label.text = Options.lang_content["slot"] % slot
	var hboxcontainer = HBoxContainer.new()
	hboxcontainer.name = "HBoxContainer"
	var save_button = Button.new()
	save_button.name = "SaveButton"
	save_button.rect_min_size = Vector2(150, 22.5)
	var delete_button = Button.new()
	delete_button.rect_min_size = Vector2(22.5, 22.5)
	delete_button.set_focus_mode(Control.FOCUS_NONE)
	var delete_stylebox = StyleBoxTexture.new()
	delete_stylebox.texture = close
	for mode in ["normal", "hover"]:
		delete_button.set("custom_styles/%s" % mode, delete_stylebox)
	delete_button.name = "DeleteButton"
	save_button.connect("button_down", self, "on_save_pressed", [slot])
	delete_button.connect("button_down", self, "on_delete_pressed", [slot])
	# set language
	if Directory.new().file_exists("res://slot%d" % slot):
		save_button.text = Options.lang_content["load"]
	else:
		save_button.text = Options.lang_content["new_game"]
		delete_button.visible = false
	add_child(slot_label)
	add_child(hboxcontainer)
	hboxcontainer.add_child(save_button)
	hboxcontainer.add_child(delete_button)

func on_save_pressed(slot):
	Playervariables.slot = "res://slot%d" % slot
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Game.tscn")

func on_delete_pressed(slot):
	# warning-ignore:return_value_discarded
	Directory.new().remove("res://slot%d" % slot)
	$HBoxContainer/SaveButton.text = Options.lang_content["new_game"]
	$HBoxContainer/DeleteButton.visible = false
