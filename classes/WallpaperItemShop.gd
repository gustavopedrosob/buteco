extends ItemShop

var color: String

func _init(color_, id: int, name_: String = "default", price: int = 100).(id, "wallpaper", name_, price):
	set_solid_color(color_)
	color = color_

func apply_texture():
	var node = get_node_or_null("/root/Game/Pub/Wall")
	if node:
		node.color = Color(color)
		save_equip()
