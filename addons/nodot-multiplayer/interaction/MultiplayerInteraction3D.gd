## A raycast for interacting with, picking up, carrying and re-orienting objects in multiplayer
class_name MultiplayerInteraction3D extends Interaction3D

var just_pressed: bool

func _input(event: InputEvent):
	just_pressed = event.is_action_pressed(interact_action)
	if event.is_action_released(interact_action):
		just_pressed = false
			
func get_input():
	var was_pressed: bool = just_pressed
	if just_pressed:
		just_pressed = false
	return was_pressed
