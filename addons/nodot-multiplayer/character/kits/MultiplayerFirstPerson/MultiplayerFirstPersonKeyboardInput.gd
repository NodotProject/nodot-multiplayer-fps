@icon("../../icons/keyboard.svg")
## Adds keyboard support to the multiplayer first person character
class_name MultiplayerFirstPersonKeyboardInput extends FirstPersonKeyboardInput

func _physics_process(delta: float) -> void:
	pass

func get_input() -> Vector2:
	return Input.get_vector(left_action, right_action, up_action, down_action)
