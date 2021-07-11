extends ItemShop

func _init(id: int, name_: String = "default", price: int = 100, color_id: int = 4).(id, "chairs", name_, price, color_id):
	set_texture("res://sprites/chairs/%s/%s.png" % [id, color_id])
	add_color_option("c5c5c5", 1)
	add_color_option("7f5e47", 2)
	add_color_option("ffcd90", 3)
	add_color_option("44372d", 4)

func apply_texture():
	get_node("/root/Game/Pub/Chairs").update_chairs("res://sprites/chairs/%s/%s.png" % [id, color_id])
	save_equip()
