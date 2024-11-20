## A node to manage the idle state of a NodotCharacter3D
class_name MultiplayerCharacterIdle3D extends CharacterIdle3D

func physics_process(_delta):
	pass
	
func action(delta: float) -> void:
	if character.direction2d != Vector2.ZERO:
		state_machine.transition(move_state_node.name)
