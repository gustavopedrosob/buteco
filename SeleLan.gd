extends MenuButton

onready var popup = get_popup()

signal reload_language

func _ready():
	popup.connect("id_pressed", self, "_on_item_pressed")
	text = Options.language
func _on_item_pressed(ID):
	match ID:
		0:
			Options.language = 'pt-br'
			emit_signal("reload_language")
			text = Options.language
			Options.create_save()
		1:
			Options.language = 'en-us'
			emit_signal("reload_language")
			text = Options.language
			Options.create_save()
