extends VBoxContainer

func _ready():
	$"GridContainer/SeleLan".connect("reload_language", self, "on_reload_language")
	exchange_language()
func exchange_language():
	match Options.language:
		'pt-br':
			$"Opcoes Title".text = 'Opções'
			$"Voltar".text = 'Voltar'
			$'GridContainer/Dif'.text = 'Selecione uma dificuldade:'
			$"GridContainer/Language Display".text = 'Selecione uma linguagem:'
			$"GridContainer/Fullscreen Display".text = 'Tela Cheia'
			$"GridContainer/Autosave Display".text = 'Auto-Salvar'
		'en-us':
			$"Opcoes Title".text = 'Options'
			$"Voltar".text = 'Back'
			$'GridContainer/Dif'.text = 'Select a Difficult'
			$"GridContainer/Language Display".text = 'Select a Language:'
			$"GridContainer/Fullscreen Display".text = 'Fullscreen'
			$"GridContainer/Autosave Display".text = 'Auto-Save'
func on_reload_language():
	exchange_language()

