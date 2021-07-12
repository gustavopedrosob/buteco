extends MenuButton

func _ready():
	# warning-ignore:return_value_discarded
	get_popup().connect("id_pressed", self, "_on_item_pressed")
	text = Options.language

func _on_item_pressed(ID):
	match ID:
		0:
			set_language('pt-br')
		1:
			set_language('en-us')

func set_language(lang: String):
	if lang != Options.language:
		Options.language = lang
		text = Options.language
