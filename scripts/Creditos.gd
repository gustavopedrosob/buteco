extends Control

func _ready():
	$"Creditos Texto".bbcode_text = str("[center]",Options.lang_content["programming"],":\nGustavo Pedroso Bernardes e Bruno Rodrigues\n",Options.lang_content["designer"],":\nGustavo Pedroso Bernardes\n",Options.lang_content["sounds"],":\nGustavo Pedroso Bernardes")

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/TelaInicial.tscn")
