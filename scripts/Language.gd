extends MenuButton

func _ready():
	# warning-ignore:return_value_discarded
	get_popup().connect("id_pressed", self, "_on_item_pressed")
	text = Options.options['language']

func _on_item_pressed(ID):
	set_language(Options.languages[ID])

func set_language(lang: String):
	if lang != Options.language:
		Options.language = lang
		text = Options.language
