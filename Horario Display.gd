extends VBoxContainer

func _ready():
	if Directory.new().file_exists(Playervariables.get_slot()):
		var dados = Playervariables.load_save()
		var data = dados['data']
		Playervariables.data['dia'] = data['dia']
		Playervariables.data['hora'] = data['hora']
		Playervariables.data['minuto'] = data['minuto']
	var minutos = Playervariables.data['minuto']
	if minutos > 0.0:
		$"Hora Display/Hora".set_wait_time(minutos)
	$"Hora Display/Hora".start()
	reload_dia()

func _process(delta):
	var horas = Playervariables.data['hora']
	var minutos_display = int(60 - $"Hora Display/Hora".time_left)
	var minutos_restantes = $"Hora Display/Hora".time_left
	$"Hora Display".text = str(Options.lang_content["hour"], horas, ":%002d" % minutos_display)
	Playervariables.data['minuto'] = minutos_restantes
	reload_dia()

func reload_dia():
	var dia = Playervariables.data['dia']
	$"Dia Display".text = str(Options.lang_content["day"], dia)

func _on_HourAndAutoSave_timeout():
	reset_timer()
	Playervariables.data['hora'] += 1
	check_if_day_end()

func check_if_day_end():
	if Playervariables.data['hora'] == 22:
		Playervariables.data['hora'] = 12
		Playervariables.data['dia'] += 1

func reset_timer():
	$"Hora Display/Hora".wait_time = 60
	$"Hora Display/Hora".start()
