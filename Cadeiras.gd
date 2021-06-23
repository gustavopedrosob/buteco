extends HBoxContainer

func _ready():
	atualizar_cadeiras("res://sprites/cadeiraa.png")


func atualizar_cadeiras(diretorio_texture):
	var cadeira1 = $cadeira1
	var cadeira2 = $cadeira2
	var cadeira3 = $cadeira3
	var cadeira4 = $cadeira4
	var lista_cadeiras = [cadeira1,cadeira2,cadeira3,cadeira4]
	var cadeira_atual= load(diretorio_texture)
	for x in lista_cadeiras:
		x.texture=cadeira_atual

func trocar_cor(cor):
	var cadeira1 = $cadeira1
	var cadeira2 = $cadeira2
	var cadeira3 = $cadeira3
	var cadeira4 = $cadeira4
	var lista_cadeiras = [cadeira1,cadeira2,cadeira3,cadeira4]
	var cadeira_atual= Color(cor)
	for x in lista_cadeiras:
		x.self_modulate=cadeira_atual

