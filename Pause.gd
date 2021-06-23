extends Control

func _ready():
	exchange_language()
func exchange_language():
	match Options.language:
		'pt-br':
			$"Pause/Pause Title".text = 'Jogo pausado'
			$"Pause/Opcoes".text = 'Opções'
			$"Pause/Salvar e sair".text = 'Salvar e sair'
			$"Pause/Salvar".text = 'Salvar'
			$"Pause/Voltar a tela inicial".text = 'Voltar a tela inicial'
		'en-us':
			$"Pause/Pause Title".text = 'Game paused'
			$"Pause/Opcoes".text = 'Options'
			$"Pause/Salvar e sair".text = 'Save and quit'
			$"Pause/Salvar".text = 'Save'
			$"Pause/Voltar a tela inicial".text = 'Return to home screen'
	
