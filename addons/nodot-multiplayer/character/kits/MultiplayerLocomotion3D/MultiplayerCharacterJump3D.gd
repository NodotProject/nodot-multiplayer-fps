## A node to manage Jump movement of a NodotCharacter3D
class_name MultiplayerCharacterJump3D extends CharacterJump3D

func physics(_delta) -> void:
	pass

func can_jump():
	var was_on_floor: bool = character.was_on_floor
	if !multiplayer.is_server():
		was_on_floor = character._is_on_floor() != null
	if was_on_floor:
		return true
	return false
