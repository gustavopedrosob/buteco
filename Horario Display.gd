extends VBoxContainer

onready var horadisplay = $"Hora Display"
onready var diadisplay = $"Dia Display"
onready var horatimer = $"Hora Display/Hora"

func _ready():
	print(Playervariables.get_slot())
	if Directory.new().file_exists(Playervariables.get_slot()) == true:
		var dados = Playervariables.load_save()
		var data = dados['data']
		Playervariables.data['dia'] = data['dia']
		Playervariables.data['hora'] = data['hora']
		Playervariables.data['minuto'] = data['minuto']
		print('aaaaaaaaaaaaaa')
	var minutos = Playervariables.data['minuto']
	if minutos > 0.0:
		horatimer.set_wait_time(minutos)
	else:
		pass
	horatimer.start()
	print('bbbbbbbbbbbbbbbbbbb')
	reload_dia()
# warning-ignore:unused_argument
func _process(delta):
	var horas = Playervariables.data['hora']
	var minutos_display = int(60 - horatimer.time_left)
	var minutos_restantes = horatimer.time_left
	if minutos_display < 10:
		match Options.language:
			'pt-br':
				horadisplay.text = str('Horario: ',horas,':0',minutos_display)
			'en-us':
				horadisplay.text = str('Hour: ',horas,':0',minutos_display)
	if minutos_display >= 10:
		match Options.language:
			'pt-br':
				horadisplay.text = str('Horario: ',horas,':',minutos_display)
			'en-us':
				horadisplay.text = str('Hour: ',horas,':',minutos_display)
	Playervariables.data['minuto'] = minutos_restantes
	reload_dia()
func reload_dia():
	var dia = Playervariables.data['dia']
	match Options.language:
		'pt-br':
			diadisplay.text = str('Dia: ',dia)
		'en-us':
			diadisplay.text = str('Day: ',dia)
func _on_HourAndAutoSave_timeout():
	reset_timer()
	Playervariables.data['hora'] += 1
	check_if_day_end()
func check_if_day_end():
	if Playervariables.data['hora'] == 22:
		Playervariables.data['hora'] = 12
		Playervariables.data['dia'] += 1
func reset_timer():
	horatimer.wait_time = 60
	horatimer.start()
