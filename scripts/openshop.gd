extends Button

func _on_openshop_pressed():
	get_parent().get_node("shop").visible = true
