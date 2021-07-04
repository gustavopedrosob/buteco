extends Node2D

var quantidade_clicks_requiridos = 0
var quantidade_de_vezes_precionado = 0

const clicks_required = [25, 35, 50]

func _ready():
	quantidade_clicks_requiridos = clicks_required[Options.dificulty]
	$Center/Alinhamento/Dica.text = Options.lang_content["click_on_beer"] % quantidade_clicks_requiridos

# warning-ignore:unused_argument
func _process(delta):
	$Center/Alinhamento/Time.text = str(Options.lang_content["time_left"], int($Timer.time_left))

func _on_TextureButton_pressed():
	$AnimationPlayer.stop()
	var multiplicador = 100.0/float(quantidade_clicks_requiridos)
	if quantidade_de_vezes_precionado < quantidade_clicks_requiridos:
		quantidade_de_vezes_precionado += 1
		$AnimationPlayer/QntPrecionado.visible = true
		$Center/Alinhamento/Center2/TextureButton/TextureProgress.value = quantidade_de_vezes_precionado * multiplicador
		$AnimationPlayer/QntPrecionado.rect_position = get_global_mouse_position() - Vector2(25,25)
		$AnimationPlayer.play("Fade")
	$AnimationPlayer/QntPrecionado.text = str(quantidade_de_vezes_precionado)
	# Aqui executa se conseguir os clicks necessarios
	if quantidade_de_vezes_precionado == quantidade_clicks_requiridos:
		Playervariables.set_jogo2(3)
		Playervariables.set_rendimento(Playervariables.valor_da_bebida)
		queue_free()

func get_multiplicador(quantidade_clicks_requeridos):
	var porcentagem = (quantidade_de_vezes_precionado * 100)/quantidade_clicks_requeridos
	var multiplicador_dinheiro_click = (3.0 * porcentagem)/100.0
	return multiplicador_dinheiro_click

func _on_Timer_timeout():
	if quantidade_de_vezes_precionado:
		Playervariables.set_jogo2(get_multiplicador(quantidade_clicks_requiridos))
		Playervariables.set_rendimento(Playervariables.valor_da_bebida)
		queue_free()
	else:
		Playervariables.clear_rendimento()
		queue_free()
	
