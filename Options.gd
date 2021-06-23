extends Node

var language = 'pt-br' #en-us,pt-br
var dificuldade = 'normal'
var auto_save = false
var fullscreen = false
var dicas = true

func _ready():
	Options.load_save()
	change_fullscreen()
func load_save():
	var arquivo = File.new()
	var erro = arquivo.open('user://options', File.READ)
	if not erro:
		var dados = arquivo.get_var()
		language = dados['language']
		dificuldade = dados['dificuldade']
		auto_save = dados['auto-save']
		fullscreen = dados['fullscreen']
	else:
		print(erro)
func create_save():
	var arquivo = File.new()
	var erro = arquivo.open('user://options', File.WRITE)
	var dados_to_save = {'language': language,'dificuldade': dificuldade,'auto-save': auto_save,'fullscreen':fullscreen}
	if not erro:
		arquivo.store_var(dados_to_save)
	else:
		print(erro)
func change_fullscreen():
	match fullscreen:
		false:
			OS.window_fullscreen = false
		true:
			OS.window_fullscreen = true
