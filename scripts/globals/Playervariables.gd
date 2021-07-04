extends Node

onready var slot setget set_slot,get_slot
var money = 0 setget set_money,get_money
var drink_value
var game_1 = 0 setget set_game_1,get_game_1
var game_2 = 0 setget set_game_2,get_game_2
var date = {'dia': 1, 'hora': 0}
var tips = {'movimento': true, 'jogo1': true, 'jogo2': true}
var shop = {
	'permissions': [],
	'equipped': {'chairs': null, 'cabinet': null, 'wallpaper': null}}

var buyed = []
var equiped = []

var barman_x_positon
var anti_pause = false
var can_walk = true
var busy = false

func set_slot(value):
	slot = value
func get_slot():
	return slot
func set_money(value):
	money = value
func get_money():
	return money
func set_game_1(value):
	game_1 = value
func get_game_1():
	return game_1
func set_game_2(value):
	game_2 = value
func get_game_2():
	return game_2
func set_yield(drink_value):
	var gain = drink_value * (game_1 + game_2)/2
	set_money(gain+money)
func clear_yield():
	set_game_1(0)
	set_game_2(0)
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
	var file = File.new()
	var error = file.open_encrypted_with_pass(slot, File.WRITE, 'zito20201805')
	var data_to_save = {
		'dinheiro': get_money(),
		'barmanposition': barman_x_positon,
		'data': date,
		'shop': shop
		}
	if not error:
		file.store_var(data_to_save)
		print('o jogo foi salvo')
	else:
		print(error)
	file.close()
func reset_vars():
	money = 0
	game_1 = 0
	game_2 = 0
	date = {'dia': 1, 'hora': 12, 'minuto': 00}
	barman_x_positon = 0
