extends MenuButton

onready var popup = get_popup()

func _ready():
	popup.connect("id_pressed", self, "_on_item_pressed")
	button_reload_language()
func _on_item_pressed(ID):
	match ID:
		0:
			Options.dificuldade = 'facil'
			seila('Easy','Facil')
			Options.create_save()
		1:
			Options.dificuldade = 'normal'
			seila('Normal','Normal')
			Options.create_save()
		2:
			Options.dificuldade = 'dificil'
			seila('Hard','Dificil')
			Options.create_save()
func button_reload_language():
	match Options.language:
		'pt-br':
			popup.set_item_text(0,'Facil')
			popup.set_item_text(1,'Normal')
			popup.set_item_text(2,'Dificil')
			match Options.dificuldade:
				'facil':
					text = 'Facil'
				'normal':
					text = 'Normal'
				'dificil':
					text = 'Dificil'
		'en-us':
			popup.set_item_text(0,'Easy')
			popup.set_item_text(1,'Normal')
			popup.set_item_text(2,'Hard')
			match Options.dificuldade:
				'facil':
					text = 'Easy'
				'normal':
					text = 'Normal'
				'dificil':
					text = 'Hard'
func seila(en,pt):
	match Options.language:
		'pt-br':
			text = pt
		'en-us':
			text = en
