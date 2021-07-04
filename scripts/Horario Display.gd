extends VBoxContainer

func _ready():
	if Directory.new().file_exists(Playervariables.get_slot()):
		var save = Playervariables.load_save()
		var date = save['data']
		Playervariables.date = date
	var minutes = Playervariables.date['hora']
	if minutes > 0:
		$"Hora Display/DayTimer".wait_time = minutes
	$"Hora Display/DayTimer".start()
	$"Dia Display".text = str(Options.lang_content["day"], Playervariables.date['dia'])

# warning-ignore:unused_argument
func _process(delta):
	var now = int(720 - $"Hora Display/DayTimer".time_left)
	var hours = int(now / 60) + 12
	var minutes = int(now % 60)
	$"Hora Display".text = str(Options.lang_content["hour"], hours, ":%002d" % minutes)
	Playervariables.date['hora'] = $"Hora Display/DayTimer".time_left

func _on_DayTimer_timeout():
	$"Hora Display/DayTimer".wait_time = 720
	$"Hora Display/DayTimer".start()
	Playervariables.date['dia'] += 1
	$"Dia Display".text = str(Options.lang_content["day"], Playervariables.date['dia'])
