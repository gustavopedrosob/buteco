extends VBoxContainer

func _ready():
	Options.connect("language_change", self, "update_language")
	update_language()
	if Directory.new().file_exists(Playervariables.slot):
		var save = Playervariables.load_save()
		var date = save['data']
		Playervariables.date = date
	while true:
		Playervariables.date["hour"] += 1
		var time = Playervariables.date["hour"]
		$Hour.text = Options.lang_content["hour"] % [int(time / 60) + 12, time % 60]
		if Playervariables.date["hour"] == 720:
			Playervariables.date["day"] += 1
			$Day.text = Options.lang_content["day"] % Playervariables.date['day']
		yield(get_tree().create_timer(1.0, false), "timeout")

func update_language():
	var time = Playervariables.date["hour"]
	$Hour.text = Options.lang_content["hour"] % [int(time / 60) + 12, time % 60]
	$Day.text = Options.lang_content["day"] % Playervariables.date['day']
