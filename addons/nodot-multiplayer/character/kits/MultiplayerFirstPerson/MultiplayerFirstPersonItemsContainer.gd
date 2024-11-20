class_name MultiplayerFirstPersonItemsContainer extends FirstPersonItemsContainer

func _physics_process(delta: float) -> void:
	pass

func get_input():
	return InputMap.has_action(reload_action) and Input.is_action_pressed(reload_action)
