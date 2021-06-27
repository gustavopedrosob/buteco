extends GridContainer

var node_equipped = null
var type

func _init(type):
	self.type = type
	columns = 5

func add_child(node, legible_unique_name: bool = false):
	if node.equipped:
		node_equipped = node
	node.connect("equiped", self, "on_child_equiped", [node])
	.add_child(node, legible_unique_name)

func on_child_equiped(node):
	if node_equipped:
		node_equipped.disequip()
	node_equipped = node
