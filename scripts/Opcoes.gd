extends VBoxContainer

func _ready():
	# warning-ignore:return_value_discarded
	$GridContainer/Language.connect("reload_language", self, "on_reload_language")
	exchange_language()

func exchange_language():
	$Title.text = Options.lang_content["options"]
	$Back.text = Options.lang_content["back"]
	$GridContainer/DifficultyLabel.text = Options.lang_content["select_dificult"]
	$GridContainer/LanguageLabel.text = Options.lang_content["select_language"]
	$GridContainer/FullscreenLabel.text = Options.lang_content["fullscreen"]
	$GridContainer/AutosaveLabel.text = Options.lang_content["auto_save"]

func on_reload_language():
	exchange_language()

