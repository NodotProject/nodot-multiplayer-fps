## A node to manage WASD of a NodotCharacter3D
class_name MultiplayerCharacterMove3D extends CharacterMove3D

func setup():
	original_speed = character.movement_speed
	InputManager.register_action(sprint_action, KEY_SHIFT)
	idle_state_node = Nodot.get_first_sibling_of_type(self, CharacterIdle3D)

func physics_process(_delta):
	pass
	
func action(_delta):
	var final_speed: float = original_speed
	if character.input_enabled and character.direction3d != Vector3.ZERO:
		if Input.is_action_pressed(sprint_action):
			final_speed = original_speed * sprint_speed_multiplier
			sprint_enabled = true
		else:
			sprint_enabled = false
		
	character.movement_speed = final_speed
	
	if character.direction3d.is_equal_approx(Vector3.ZERO):
		state_machine.transition(idle_state_node.name)

func get_input():
	return {
		"sprint": Input.is_action_pressed(sprint_action),
		"jump": Input.is_action_pressed("jump_action")
	}
