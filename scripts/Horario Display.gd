extends VBoxContainer

func _ready():
	if Directory.new().file_exists(Playervariables.slot):
		var save = Playervariables.load_save()
		var date = save['data']
		Playervariables.date = date
	while true:
		yield(get_tree().create_timer(1.0), "timeout")
		Playervariables.date["hour"] += 1
		var time = Playervariables.date["hour"]
		$"Hora Display".text = Options.lang_content["hour"] % [int(time / 60) + 12, time % 60]
		if Playervariables.date["hour"] == 720:
			Playervariables.date["day"] += 1
			$"Dia Display".text = Options.lang_content["day"] % Playervariables.date['day']
