extends Node

onready var slot setget set_slot,get_slot
var dinheiro = 0 setget set_dinheiro,get_dinheiro
var valor_da_bebida
var jogo1 = 0 setget set_jogo1,get_jogo1
var jogo2 = 0 setget set_jogo2,get_jogo2
var data = {'dia': 1, 'hora': 0}
var dicas = {'movimento': true, 'jogo1': true, 'jogo2': true}
var shop = {
	'permissions': [],
	'equipped': {'chairs': null, 'cabinet': null, 'wallpaper': null}}

var buyed = []
var equiped = []

var Barman_x_positon
var antipause = false
var can_walk = true
var esta_ocupado = false

func set_slot(valor):
	slot = valor
func get_slot():
	return slot
func set_dinheiro(valor):
	dinheiro = valor
func get_dinheiro():
	return dinheiro
func set_jogo1(valor):
	jogo1 = valor
func get_jogo1():
	return jogo1
func set_jogo2(valor):
	jogo2 = valor
func get_jogo2():
	return jogo2
func set_rendimento(valor_bebida):
	var ganho = valor_bebida * (jogo1 + jogo2)/2
	set_dinheiro(ganho+dinheiro)
func clear_rendimento():
	set_jogo1(0)
	set_jogo2(0)
func load_save():
	var arquivo = File.new()
	var erro = arquivo.open_encrypted_with_pass(slot, File.READ, 'zito20201805')
	if not erro:
		var dados = arquivo.get_var()
		return dados
	else:
		print(erro)
	arquivo.close()
func create_save():
	var arquivo = File.new()
	var erro = arquivo.open_encrypted_with_pass(slot, File.WRITE, 'zito20201805')
	var dados_to_save = {
		'dinheiro': get_dinheiro(),
		'barmanposition': Barman_x_positon,
		'data':data,
		'shop': shop
		}
	if not erro:
		arquivo.store_var(dados_to_save)
		print('o jogo foi salvo')
	else:
		print(erro)
	arquivo.close()
func reset_vars():
	dinheiro = 0
	jogo1 = 0
	jogo2 = 0
	data = {'dia': 1, 'hora': 12, 'minuto': 00}
	Barman_x_positon = 0
