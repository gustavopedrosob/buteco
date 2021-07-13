extends HBoxContainer

func _ready():
	update_chairs("res://sprites/chairs/1/4.png")

func update_chairs(texture_path):
	for child in get_children():
		child.texture = load(texture_path)

