extends Sprite

onready var normal = load('res://sprites/barman/barman normal.png')
onready var serving = load('res://sprites/barman/barman servindo.png')
onready var mixology = load('res://sprites/barman/barman mixologia.png')

func _ready():
	texture = normal
