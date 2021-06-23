extends VBoxContainer

func _ready():
	$"GridContainer/SeleLan".connect("reload_language", self, "on_reload_language")
	exchange_language()

func exchange_language():
	$"Opcoes Title".text = Options.lang_content["options"]
	$"Voltar".text = Options.lang_content["back"]
	$'GridContainer/Dif'.text = Options.lang_content["select_dificult"]
	$"GridContainer/Language Display".text = Options.lang_content["select_language"]
	$"GridContainer/Fullscreen Display".text = Options.lang_content["fullscreen"]
	$"GridContainer/Autosave Display".text = Options.lang_content["auto_save"]

func on_reload_language():
	exchange_language()

