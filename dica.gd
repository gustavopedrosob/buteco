extends Control

var opcao_dica = Options.dicas
var dica = Playervariables.dicas["movimento"]
#STRINGS
var dica_txt = 'Dica: aperte A e D para se mover.'
#NOS
onready var animacao_node = $CenterContainer/AnimationPlayer
onready var dica_node = $CenterContainer/AnimationPlayer/Dica
onready var timer_node = $Timer

func _ready():
	if opcao_dica == true and dica == true:
		animacao_node.connect("animation_finished", self, "on_animation_finished")
		timer_node.connect("timeout", self,'on_timeout')
		dica_node.text = dica_txt
		timer_node.start()
	else:
		visible = false
func on_animation_finished(animation):
	if animation == "Fadeout":
		visible = false
		dica = false
func on_timeout():
	animacao_node.play("Fadeout")
