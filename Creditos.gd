extends Control

func _ready():
	$"Centralizado/Creditos Texto".bbcode_text = str("[center]",Options.lang_content["programming"],":\nGustavo Pedroso Bernardes e Bruno Rodrigues\n",Options.lang_content["designer"],":\nGustavo Pedroso Bernardes\n",Options.lang_content["sounds"],":\nGustavo Pedroso Bernardes")
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://TelaInicial.tscn")
