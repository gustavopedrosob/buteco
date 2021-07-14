extends Node

signal language_change

var language = 'pt-br' setget set_language, get_language
const languages = ["pt-br", "en-us"]
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
	file.open('res://lang/%s.json' % language, File.READ)
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
	var error = arquivo.open('res://options', File.READ)
	if error:
		self.language = "en-us"
	else:
		var data = arquivo.get_var()
		self.language = data['language']
		dificulty = data['dificulty']
		auto_save = data['auto-save']
		fullscreen = data['fullscreen']
		volume = data['volume']

func create_save():
	var file = File.new()
	var error = file.open('res://options', File.WRITE)
	var data = {
		'language': language,
		'dificulty': dificulty,
		'auto-save': auto_save,
		'fullscreen':fullscreen,
		'volume': volume}
	if error:
		print(error)
	else:
		file.store_var(data)

func change_fullscreen():
	OS.window_fullscreen = fullscreen
