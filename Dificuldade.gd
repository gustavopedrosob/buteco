extends MenuButton

onready var popup = get_popup()

func _ready():
	popup.connect("id_pressed", self, "_on_item_pressed")
	button_reload_language()
func _on_item_pressed(ID):
	match ID:
		0:
			Options.dificuldade = 'facil'
			text = Options.lang_content["easy"]
			Options.create_save()
		1:
			Options.dificuldade = 'normal'
			text = Options.lang_content["normal"]
			Options.create_save()
		2:
			Options.dificuldade = 'dificil'
			text = Options.lang_content["hard"]
			Options.create_save()
func button_reload_language():
	popup.set_item_text(0, Options.lang_content["easy"])
	popup.set_item_text(1, Options.lang_content["normal"])
	popup.set_item_text(2, Options.lang_content["hard"])
	match Options.dificuldade:
		'facil':
			text = Options.lang_content["easy"]
		'normal':
			text = Options.lang_content["normal"]
		'dificil':
			text = Options.lang_content["hard"]
