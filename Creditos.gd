extends Control

func _ready():
	match Options.language:
		'pt-br':
			$"Centralizado/Creditos Texto".bbcode_text = "[center]Programação:\nGustavo Pedroso Bernardes e Bruno Rodrigues\nDesigne:\nGustavo Pedroso Bernardes\nSons:\nGustavo Pedroso Bernardes"
		'en-us':
			$"Centralizado/Creditos Texto".bbcode_text = "[center]Programming:\nGustavo Pedroso Bernardes e Bruno Rodrigues\nDesigne:\nGustavo Pedroso Bernardes\nSounds:\nGustavo Pedroso Bernardes"
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://TelaInicial.tscn")
