extends Node

onready var customer = load("res://scenes/Costumer.tscn")

func _ready():
	if Directory.new().file_exists(Playervariables.slot):
		var save = Playervariables.load_save()
		Playervariables.money = save['dinheiro']
	spawn_client()
	auto_save()
	Options.connect("language_change", self, "update_language")

func on_cena_tree_exited():
	spawn_client()

func auto_save():
	while true:
		yield(get_tree().create_timer(60.0), "timeout")
		if Options.auto_save:
			Playervariables.create_save()
			print('auto-save funcionado')

func spawn_client():
	yield(get_tree().create_timer(Functions.get_random_int(3, 10)), "timeout")
	var spawn = customer.instance()
	spawn.connect("tree_exited", self, "on_cena_tree_exited")
	Functions.add_and_move_child(self, spawn, 1)

func update_language():
	$VBoxContainer/Money.text = Options.lang_content["money"] % Playervariables.money

