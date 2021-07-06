extends CenterContainer

var node_equipped

func _init(type):
	name = type
	var grid_container = GridContainer.new()
	grid_container.name = "GridContainer"
	grid_container.columns = 5
	.add_child(grid_container)

func add_child(node, legible_unique_name: bool = false):
	if node.equipped:
		node_equipped = node
	node.connect("equipped", self, "on_child_equipped", [node])
	$GridContainer.add_child(node, legible_unique_name)

func on_child_equipped(node):
	if node_equipped:
		node_equipped.disequip()
	node_equipped = node
