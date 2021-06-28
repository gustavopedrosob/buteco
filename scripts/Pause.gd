extends Control

func _ready():
	exchange_language()

func exchange_language():
	$"Pause/Pause Title".text = Options.lang_content["game_paused"]
	$"Pause/Opcoes".text = Options.lang_content["options"]
	$"Pause/Salvar e sair".text = Options.lang_content["save_and_leave"]
	$"Pause/Salvar".text = Options.lang_content["save"]
	$"Pause/Voltar a tela inicial".text = Options.lang_content["return_to_home_screen"]
