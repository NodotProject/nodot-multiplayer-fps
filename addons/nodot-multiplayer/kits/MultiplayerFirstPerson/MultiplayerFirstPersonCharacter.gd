## A CharacterBody3D for multiplayer first person games
class_name MultiplayerFirstPersonCharacter extends FirstPersonCharacter

@export var character_mover: CharacterMover3D
@export var character_look: CharacterLook3D
@export var character_jump: CharacterJump3D
@export var first_person_items: MultiplayerFirstPersonItemsContainer
@export var rollback_synchronizer: RollbackSynchronizer
@export var input: PlayerInput

func _ready() -> void:
	camera.fov = fov

	if has_node("Head"):
		head = get_node("Head")
		camera = get_node("Head/Camera3D")
	
	var peer_id: int = int(str(name))
	input.set_multiplayer_authority(peer_id)
	input.kb.set_multiplayer_authority(peer_id)
	input.mouse.set_multiplayer_authority(peer_id)
	rollback_synchronizer.process_settings()
	
	input.action()
		
	if has_method("_after_ready"):
		call("_after_ready")

func _rollback_tick(delta, tick, is_fresh):
	input_states["direction"] = input.direction
	input_states["look_angle"] = input.look_angle
	input_states["mouse_action"] = input.mouse_action
	input_states["jump"] = input.jump_pressed
	character_mover.action(delta)
	character_look.action(delta)
	character_jump.action()
	first_person_items.action()
	if input.reload_pressed:
		first_person_items.reload()
