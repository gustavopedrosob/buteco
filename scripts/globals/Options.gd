extends Node

signal language_change

var options = {
	'language': 'pt-br',
	'auto-save': true,
	'fullscreen': true,
	'volume': 100,
	'difficulty': 1
}
var lang_content

func get_difficulty_as_str(difficulty: int = options['difficulty']):
	return ['easy', 'normal', 'hard'][difficulty]

func set_language(language: String):
	options['language'] = language
	setup_language()


func setup_language(language: String = options['language']):
	var file = File.new()
	var error = file.open('res://lang/%s.json' % language, File.READ)
	if not error:
		lang_content = parse_json(file.get_as_text())
	emit_signal("language_change")


func set_fullscreen(fullscreen: bool):
	options['fullscreen'] = fullscreen


func setup_fullscreen(fullscreen: bool = options['fullscreen']):
	OS.window_fullscreen = fullscreen


func _ready():
	Options.read()
	setup_fullscreen()
	setup_language()


func read():
	var file = File.new()
	var error = file.open('res://options', File.READ)
	if not error:
		options = file.get_var()


func save():
	var file = File.new()
	var error = file.open('res://options', File.WRITE)
	if not error:
		file.store_var(options)
