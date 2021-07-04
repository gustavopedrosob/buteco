extends MenuButton

func _ready():
	# warning-ignore:return_value_discarded
	get_popup().connect("id_pressed", self, "_on_item_pressed")
	button_reload_language()

func _on_item_pressed(ID):
	Options.dificulty = ID
	text = Options.lang_content[Options.difficulties[ID]]
	Options.create_save()

func button_reload_language():
	get_popup().set_item_text(0, Options.lang_content["easy"])
	get_popup().set_item_text(1, Options.lang_content["normal"])
	get_popup().set_item_text(2, Options.lang_content["hard"])
	text = Options.lang_content[Options.difficulties[Options.dificulty]]
