extends ItemShop

func _init(id: int, name_: String = "default", price: int = 100).(id, "cabinet", name_, price):
	set_texture("res://sprites/cabinet_icons/%s.png" % id)
	add_color_option("c5c5c5", 1)
	add_color_option("ffcd90", 2)
	add_color_option("7f5e47", 3)
	add_color_option("8a888b", 4)
	add_color_option("44372d", 5)

func apply_texture():
	get_node("/root/Node/Bar/Balcao").texture = load("res://sprites/cabinet/%s/%s.png" % [id, color_id])
	save_equip()
