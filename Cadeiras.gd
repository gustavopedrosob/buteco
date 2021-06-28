extends HBoxContainer

func _ready():
	atualizar_cadeiras("res://sprites/cadeiraa.png")

func atualizar_cadeiras(diretorio_texture):
	for x in [$cadeira1, $cadeira2, $cadeira3, $cadeira4]:
		x.texture = load(diretorio_texture)

