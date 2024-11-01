## A node to manage WASD of a NodotCharacter3D
class_name MultiplayerCharacterMover3D extends CharacterMover3D

func physics(delta: float) -> void:
	pass

func action(delta: float):
	var basis: Basis
	if third_person_camera:
		basis = character.current_camera.global_transform.basis
	else:
		basis = character.transform.basis
	var character_direction: Vector2 = character.input_states["direction"]
	direction = (basis * Vector3(character_direction.x, 0, character_direction.y))
	
	if character.input_enabled and direction != Vector3.ZERO:
		if character.input_states["sprint"]:
			sm.set_state(state_ids["sprint"])
		else:
			sm.set_state(state_ids["walk"])
	
	var was_on_floor: bool = character.was_on_floor
	if !multiplayer.is_server():
		was_on_floor = character._is_on_floor() != null
		
	if was_on_floor:
		character.velocity *= NetworkTime.physics_factor
		move_ground(delta)
		character.velocity.y = lerp(character.velocity.y, 0.0, delta * 2.0)
		character.velocity /= NetworkTime.physics_factor
	else:
		move_air(delta)
		character.velocity *= NetworkTime.physics_factor
		character.move_and_slide()
		character.velocity /= NetworkTime.physics_factor
	
	set_rigid_interaction()

func get_input():
	return {
		"sprint": Input.is_action_pressed(sprint_action),
		"jump": Input.is_action_pressed("jump_action")
	}
	
