extends ItemShop

var color: String

func _init(color, id: int, name_: String = "default", price: int = 100).(id, "wallpaper", name_, price):
	set_solid_color(color)
	self.color = color

func apply_texture():
	get_node("/root/Node/Bar/fundo").modulate = Color(color)
