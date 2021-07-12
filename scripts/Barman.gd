extends Sprite

onready var normal = load('res://sprites/barman/Normal.png')
onready var serving = load('res://sprites/barman/Serving.png')
onready var mixology = load('res://sprites/barman/Mixology.png')

func _ready():
	texture = normal
