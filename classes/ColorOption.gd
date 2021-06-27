extends Button

class_name ColorOption

func _init(color: String):
	var styleboxflat = StyleBoxFlat.new()
	styleboxflat.bg_color = Color(color)
	rect_min_size = Vector2(16, 24)
	set("custom_styles/hover", styleboxflat)
	set("custom_styles/normal", styleboxflat)
	
