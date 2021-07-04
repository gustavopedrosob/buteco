extends Node

var language = 'pt-br' #en-us,pt-br
var dificulty = 1
const difficulties = ["easy", "normal", "hard"]
var auto_save = false
var fullscreen = false
var tips = true
var lang_content = null

func _ready():
	Options.load_save()
	change_fullscreen()
	get_language()

func get_language():
	var file = File.new()
	file.open('lang/%s.json' % language, File.READ)
	var text = file.get_as_text()
	lang_content = parse_json(text)

func load_save():
	var arquivo = File.new()
	var erro = arquivo.open('res://options', File.READ)
	if not erro:
		var dados = arquivo.get_var()
		language = dados['language']
		dificulty = dados['dificulty']
		auto_save = dados['auto-save']
		fullscreen = dados['fullscreen']
	else:
		print(erro)

func create_save():
	var arquivo = File.new()
	var erro = arquivo.open('res://options', File.WRITE)
	var dados_to_save = {'language': language,'dificulty': dificulty,'auto-save': auto_save,'fullscreen':fullscreen}
	if not erro:
		arquivo.store_var(dados_to_save)
	else:
		print(erro)

func change_fullscreen():
	OS.window_fullscreen = fullscreen
