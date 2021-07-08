extends MarginContainer

var node_equipped
var type

func _init(type_):
	for margin in ["right", "top", "left", "bottom"]:
		set("custom_constants/margin_%s" % margin, 20)
	name = Options.lang_content[type_]
	type = type_
	var scroll_container = ScrollContainer.new()
	scroll_container.name = "ScrollContainer"
	scroll_container.rect_min_size = Vector2(530, 400)
	.add_child(scroll_container)
	var grid_container = GridContainer.new()
	grid_container.name = "GridContainer"
	grid_container.columns = 5
	scroll_container.add_child(grid_container)

func add_child(node, legible_unique_name: bool = false):
	if node.equipped:
		node_equipped = node
	node.connect("equipped", self, "on_child_equipped", [node])
	$ScrollContainer/GridContainer.add_child(node, legible_unique_name)

func on_child_equipped(node):
	if node_equipped:
		node_equipped.disequip()
	node_equipped = node
