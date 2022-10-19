extends HSlider

func _ready():
	value = Options.options['volume']

func _on_HSlider_value_changed(value):
	Options.options['volume'] = int(value)
