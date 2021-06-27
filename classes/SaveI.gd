extends VBoxContainer

class_name SaveI

func _init(slot):
	var slot_label = Label.new() 
	slot_label.text = "Slot"
	var hboxcontainer = HBoxContainer.new()
	hboxcontainer.name = "HBoxContainer"
	var save_button = Button.new()
	save_button.name = "SaveButton"
	var delete_button = Button.new()
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
	Playervariables.set_slot(slot)
	get_tree().change_scene("res://Jogo.tscn")


func on_delete_pressed(slot):
	Directory.new().remove(slot)
	$HBoxContainer/SaveButton.text = Options.lang_content["new_game"]
	$HBoxContainer/DeleteButton.visible = false
