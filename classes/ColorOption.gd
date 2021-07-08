extends Button

class_name ColorOption

func _init(color: String):
	var styleboxflat = StyleBoxFlat.new()
	styleboxflat.bg_color = Color(color)
	rect_min_size = Vector2(16, 24)
	for style in ["hover", "normal", "pressed", "focus"]:
		set("custom_styles/%s" % style, styleboxflat)

	
