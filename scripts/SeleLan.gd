extends MenuButton

signal reload_language

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
		Options.get_language()
		emit_signal("reload_language")
		text = Options.language
		Options.create_save()
