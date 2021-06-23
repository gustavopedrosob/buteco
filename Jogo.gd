extends Node

var dinheiro setget set_dinheiro, get_dinheiro

func _ready():
	set_dinheiro(0)

func set_dinheiro(valor):
	dinheiro = valor
func get_dinheiro():
	return dinheiro

