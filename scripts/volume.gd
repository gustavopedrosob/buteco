extends HSlider

func _ready():
	value = Options.volume

func _on_HSlider_value_changed(value):
	Options.volume = int(value)
