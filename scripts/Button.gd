extends Node

onready var cliente = load("res://scenes/Cliente.tscn")

func _ready():
	if Directory.new().file_exists(Playervariables.get_slot()):
		var dados = Playervariables.load_save()
		Playervariables.set_dinheiro(dados['dinheiro'])
	reset_timer()
	$"Button".text = Options.lang_content["shop"]

func _process(delta):
	$"Alinhamento/Dinheiro Display".text = str(Options.lang_content["money"], Playervariables.dinheiro)

func _on_Timer_timeout():
	spawn_client()

func reset_timer():
	$Timer.set_wait_time(Functions.get_random_int(3, 10))
	$Timer.start()

func on_cena_tree_exited():
	reset_timer()

func _on_AutoSave_timeout():
	if Options.auto_save:
		Playervariables.create_save()
		print('auto-save funcionado')

func spawn_client():
	var spawn = cliente.instance()
	spawn.connect("tree_exited", self, "on_cena_tree_exited")
	$Spawner.add_child(spawn)

func _on_Button_pressed():
	$shop.visible = true
	get_tree().paused = true

