extends Node

var rand_generate = RandomNumberGenerator.new()
onready var cliente = load("res://Cliente.tscn")
onready var dinheirodisplay = $"Alinhamento/Dinheiro Display"
var dinheiro = Playervariables.get_dinheiro()

var tempo_min = 3
var tempo_max = 10

func _ready():
	if Directory.new().file_exists(Playervariables.get_slot()) == true:
		var dados = Playervariables.load_save()
		Playervariables.set_dinheiro(dados['dinheiro'])
	reset_timer()
	$"Button".text = Options.lang_content["shop"]

func _process(delta):
	dinheirodisplay.text = str(Options.lang_content["money"], Playervariables.dinheiro)
func _on_Timer_timeout():
	spawn_client()
func reset_timer():
	$Timer.set_wait_time(get_random_int(tempo_min,tempo_max))
	$Timer.start()
func on_cena_tree_exited():
	reset_timer()
func _on_AutoSave_timeout():
	if Options.auto_save == true:
		Playervariables.create_save()
		print('auto-save funcionado')
func get_random_int(num1,num2):
	rand_generate.randomize()
	return rand_generate.randi_range(num1,num2)
func spawn_client():
	var spawn = cliente.instance()
	spawn.connect("tree_exited", self, "on_cena_tree_exited")
	$Spawner.add_child(spawn)


func _on_Button_pressed():
	$shop.visible=true
	get_tree().paused=true
