extends VBoxContainer

func _ready():
	if Directory.new().file_exists(Playervariables.get_slot()):
		var dados = Playervariables.load_save()
		var data = dados['data']
		Playervariables.data = data
	var minutos = Playervariables.data['hora']
	if minutos > 0:
		$"Hora Display/DayTimer".wait_time = minutos
	$"Hora Display/DayTimer".start()
	$"Dia Display".text = str(Options.lang_content["day"], Playervariables.data['dia'])

# warning-ignore:unused_argument
func _process(delta):
	var tempo_atual = int(720 - $"Hora Display/DayTimer".time_left)
	var horas = int(tempo_atual / 60) + 12
	var minutos = int(tempo_atual % 60)
	$"Hora Display".text = str(Options.lang_content["hour"], horas, ":%002d" % minutos)
	Playervariables.data['hora'] = $"Hora Display/DayTimer".time_left

func _on_DayTimer_timeout():
	$"Hora Display/DayTimer".wait_time = 720
	$"Hora Display/DayTimer".start()
	Playervariables.data['dia'] += 1
	$"Dia Display".text = str(Options.lang_content["day"], Playervariables.data['dia'])
