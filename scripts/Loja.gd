extends WindowDialog

const GroupShop = preload("res://classes/GroupShop.gd")
const Wallpaper = preload("res://classes/WallpaperItemShop.gd")
const Chair = preload("res://classes/ChairItemShop.gd")
const Cabinet = preload("res://classes/CabinetItemShop.gd")
var groups = {}

func _ready():
	window_title = Options.lang_content["shop"]
	load_save()
	add_group(GroupShop.new("wallpapers"))
	add_group(GroupShop.new("chairs"))
	add_group(GroupShop.new("cabinets"))
	groups["wallpapers"].add_child(Wallpaper.new("324531", 1, "default"))
	groups["wallpapers"].add_child(Wallpaper.new("000000", 2, "black"))
	groups["wallpapers"].add_child(Wallpaper.new("ffffff", 3, "white"))
	groups["wallpapers"].add_child(Wallpaper.new("bc6500", 4, "orange"))
	groups["wallpapers"].add_child(Wallpaper.new("207800", 5, "green"))
	groups["wallpapers"].add_child(Wallpaper.new("000637", 6, "blue"))
	groups["wallpapers"].add_child(Wallpaper.new("530000", 7, "red"))
	groups["wallpapers"].add_child(Wallpaper.new("e1be04", 8, "yellow"))
	groups["wallpapers"].add_child(Wallpaper.new("250026", 9, "purple"))
	groups["wallpapers"].add_child(Wallpaper.new("452b12", 10, "brown"))
	groups["wallpapers"].add_child(Wallpaper.new("565554", 11, "grey"))
	groups["chairs"].add_child(Chair.new(1))
	groups["chairs"].add_child(Chair.new(2))
	groups["chairs"].add_child(Chair.new(3))
	groups["chairs"].add_child(Chair.new(4))
	groups["chairs"].add_child(Chair.new(5))
	groups["chairs"].add_child(Chair.new(6))
	groups["chairs"].add_child(Chair.new(7))
	groups["chairs"].add_child(Chair.new(8))
	groups["chairs"].add_child(Chair.new(9))
	groups["chairs"].add_child(Chair.new(10))
	groups["cabinets"].add_child(Cabinet.new(1))
	groups["cabinets"].add_child(Cabinet.new(2))
	groups["cabinets"].add_child(Cabinet.new(3))
	groups["cabinets"].add_child(Cabinet.new(4))
	groups["cabinets"].add_child(Cabinet.new(5))
	groups["cabinets"].add_child(Cabinet.new(6))

func load_save():
	var slot = Playervariables.slot
	# if has a old save to read:
	if slot:
		if Directory.new().file_exists(slot):
			var save = Playervariables.load_save()
			Playervariables.shop = save["shop"]

func _unhandled_key_input(event):
	if event.scancode == KEY_S and event.pressed:
		if visible:
			visible = false
		else:
			popup()

func add_group(group: GroupShop):
	groups[group.type] = group
	$TabContainer.add_child(group)

func _on_message_error_timeout():
	$InsufficientMoney.visible = false
