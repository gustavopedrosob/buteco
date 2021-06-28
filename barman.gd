extends Sprite

onready var normal = load('res://sprites/barman/barman normal.png')
onready var servindo = load('res://sprites/barman/barman servindo.png')
onready var mixologia = load('res://sprites/barman/barman mixologia.png')

func _ready():
	texture = normal
