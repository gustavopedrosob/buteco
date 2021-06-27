extends VBoxContainer

class_name ItemShop

signal equipped
var price: int
var buyed: int = false
var equipped: bool = false
var id: int
var color_id: int
var type: String

func _ready():
	load_save()

func _init(id: int, type: String, name_: String = "default", price: int = 100, color_id: int = 1):
	self.id = id
	self.price = price
	self.type = type
	self.color_id = color_id
	var price_label = Label.new()
	price_label.text = "%d$" % price
	var name_label = Label.new()
	if name_ == "default":
		name_label.text = Options.lang_content["model"] % id
	else:
		name_label.text = Options.lang_content[name_]
	var button = Button.new()
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

func load_save():
	var slot = Playervariables.get_slot()
	# if has a old save to read:
	if Directory.new().file_exists(slot):
		var save = Playervariables.load_save()
		# if was buyed:
		if "%s/%s" % [type, id] in save["shop"]["permissions"]:
			buyed = true
		var code: String = save["shop"]["equipped"][type]
		var codes = code.split(":")
		var id = int(codes[0])
		var color_id = int(codes[1])
		# if was equipped:
		if self.id == id:
			self.color_id = color_id
			equip()
	else:
		self.color_id = 1

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

func add_color_option(color, color_id):
	var color_option_widget = ColorOption.new(color)
	color_option_widget.connect("button_down", self, "on_color_option_pressed", [color_id])
	$Colors.add_child(color_option_widget)

func on_color_option_pressed(color_id):
	self.color_id = color_id
	apply_texture()

func on_button_pressed():
	if buyed:
		equip()
	elif equipped:
		pass
	elif Playervariables.dinheiro >= price:
		buy()
	else:
		error_message()

func error_message():
	get_node("/root/Node/shop/mensagem de erro/Timer").start()
	get_node("/root/Node/shop/mensagem de erro").visible = true

func equip():
	apply_texture()
	emit_signal("equipped")
	equipped = true
	$Button.text = Options.lang_content["equipped"]
	save_equip()

func disequip():
	equipped = false
	$Button.text = Options.lang_content["equip"]

func buy():
	$Button.text = Options.lang_content["equip"]
	Playervariables.dinheiro -= price
	$Colors.visible = true
	buyed = true
	save_buy()

func save_equip():
	Playervariables.shop["equipped"][type] = "%s:%s" % [id, color_id]

func save_buy():
	Playervariables.shop["permissions"].append("%s/%s" % [type, id])
