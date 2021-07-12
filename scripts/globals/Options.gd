extends Node

signal language_change

#en-us,pt-br
var language = 'pt-br' setget set_language, get_language
var dificulty = 1
const difficulties = ["easy", "normal", "hard"]
var auto_save = false
var fullscreen = false
var tips = true
var lang_content = null
var volume = 100

func set_language(value):
	language = value
	var file = File.new()
	file.open('lang/%s.json' % language, File.READ)
	var text = file.get_as_text()
	lang_content = parse_json(text)
	emit_signal("language_change")

func get_language():
	return language

func _ready():
	Options.load_save()
	change_fullscreen()

func load_save():
	var arquivo = File.new()
	var erro = arquivo.open('res://options', File.READ)
	if not erro:
		var dados = arquivo.get_var()
		self.language = dados['language']
		dificulty = dados['dificulty']
		auto_save = dados['auto-save']
		fullscreen = dados['fullscreen']
		volume = dados['volume']
	else:
		print(erro)

func create_save():
	var arquivo = File.new()
	var erro = arquivo.open('res://options', File.WRITE)
	var dados_to_save = {
		'language': language,
		'dificulty': dificulty,
		'auto-save': auto_save,
		'fullscreen':fullscreen,
		'volume': volume}
	if not erro:
		arquivo.store_var(dados_to_save)
	else:
		print(erro)

func change_fullscreen():
	OS.window_fullscreen = fullscreen
