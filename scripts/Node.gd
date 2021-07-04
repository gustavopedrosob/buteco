extends Node


func _ready():
	# warning-ignore:return_value_discarded
	$Opcoes/CenterContainer/VBoxContainer/Voltar.connect("pressed", self, "_on_Voltar_pressed")
	# warning-ignore:return_value_discarded
	$Pause/CenterContainer/Pause/Opcoes.connect("pressed", self, "_on_Opcoes_pressed")

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel") and Playervariables.antipause == false:
		if get_tree().paused:
			get_tree().paused = false
			$Pause.visible = true
			$Opcoes.visible = false
			self.visible = false
		else:
			get_tree().paused = true
			self.visible = true
func _on_Opcoes_pressed():
	$Pause.visible = false
	$Opcoes.visible = true
func _on_Voltar_pressed():
	$Pause.visible = true
	$Opcoes.visible = false
