extends Button

var hover = load("res://botaohover.tres")
var pressed_tres = load("res://botaopressed.tres") 
var normal = load("res://botão.tres")
var font = load("res://fonts/Font.tres")

func _init():
	rect_min_size = Vector2(200, 30)
	set("custom_styles/hover", hover)
	set("custom_styles/pressed", pressed_tres)
	set("custom_styles/normal", normal)
	set("custom_fonts/font", font)
	set("custom_colors/font_color", Color(0, 0, 0))
	set_focus_mode(Control.FOCUS_NONE)
