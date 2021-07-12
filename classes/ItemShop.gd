extends VBoxContainer

class_name ItemShop

signal equipped
var price: int
var buyed: int = false
var equipped: bool = false
var id: int
var color_id: int = 0
var type: String

func _init(id_: int, type_: String, name_: String = "default", price_: int = 100, color_id_: int = 1):
	id = id_
	price = price_
	type = type_
	color_id = color_id_
	var price_label = Label.new()
	price_label.text = "%d$" % price
	var name_label = Label.new()
	if name_ == "default":
		name_label.text = Options.lang_content["model"] % id
	else:
		name_label.text = Options.lang_content[name_]
	var button = Button.new()
	button.rect_min_size = Vector2(100, 10)
	button.name = "Button"
	if equipped:
		button.text = Options.lang_content["equiped"]
		
	elif buyed:
		button.text = Options.lang_content["equip"]
	else:
		button.text = Options.lang_content["buy"]
	button.connect("button_down", self, "on_button_pressed")
	var colors = HBoxContainer.new()
	colors.name = "Colors"
	colors.visible = false
	add_child(price_label)
	add_child(colors)
	add_child(name_label)
	add_child(button)

func _enter_tree():
	read_save()

func read_save():
	var save = Playervariables.shop
	# if was buyed:
	if "%s/%s" % [type, id] in save["permissions"]:
		buy(false, false)
		print("it was buyed")
	var code = save["equipped"][type]
	# if was equipped:
	if code:
		var codes = code.split(":")
		var save_id = int(codes[0])
		var save_color_id = int(codes[1])
		# if was equipped:
		if id == save_id:
			color_id = save_color_id
			equip(false)

func apply_texture():
	pass

func set_texture(texture_path):
	var image = TextureRect.new()
	image.texture = load(texture_path)
	image.expand = true
	image.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	image.rect_min_size = Vector2(100, 100)
	add_child(image)
	move_child(image, 1)

func set_solid_color(rgb_color):
	var image = ColorRect.new()
	image.color = Color(rgb_color)
	image.rect_min_size = Vector2(100, 100)
	add_child(image)
	move_child(image, 1)

func add_color_option(color, color_id_):
	var color_option_widget = ColorOption.new(color)
	color_option_widget.connect("button_down", self, "on_color_option_pressed", [color_id_])
	$Colors.add_child(color_option_widget)

func on_color_option_pressed(color_id_):
	color_id = color_id_
	apply_texture()

func on_button_pressed():
	if buyed:
		equip()
	elif equipped:
		pass
	elif Playervariables.money >= price:
		buy()
	else:
		error_message()

func error_message():
	error_message_visible(true)
	yield(get_tree().create_timer(2.0), "timeout")
	error_message_visible(false)

func error_message_visible(visible_: bool):
	get_node("/root/Game/Shop/InsufficientMoney").visible = visible_
	get_node("/root/Game/Shop/CenterContainer").visible = visible_

func equip(save = true):
	apply_texture()
	emit_signal("equipped")
	equipped = true
	$Button.text = Options.lang_content["equipped"]
	if save:
		save_equip()

func disequip():
	equipped = false
	$Button.text = Options.lang_content["equip"]

func buy(pay = true, save = true):
	$Button.text = Options.lang_content["equip"]
	if pay:
		Playervariables.money -= price
	$Colors.visible = true
	buyed = true
	if save:
		save_buy()

func save_equip():
	Playervariables.shop["equipped"][type] = "%s:%s" % [id, color_id]

func save_buy():
	Playervariables.shop["permissions"].append("%s/%s" % [type, id])
