extends FirstPersonCharacter

@export var character_mover: CharacterMover3D
@export var character_look: CharacterLook3D
@export var rollback_synchronizer: RollbackSynchronizer
@export var display_name: String = "": set = _set_display_name
@export var input: PlayerInput

func _after_ready():
	var next_position = MultiplayerManager.spawn_points.get_next_item().global_position
	global_position = next_position
	
	if is_authority_owner():
		%VisibleGun.queue_free()
	
	var peer_id: int = int(str(name))
	input.set_multiplayer_authority(peer_id)
	input.kb.set_multiplayer_authority(peer_id)
	input.mouse.set_multiplayer_authority(peer_id)
	rollback_synchronizer.process_settings()
	display_name = str(name)
	input.action()

func _set_display_name(new_display_name: String):
	display_name = new_display_name
	$DisplayName.text = new_display_name


func _rollback_tick(delta, tick, is_fresh):
	direction = input.direction
	look_angle = input.look_angle
	character_mover.action(delta)
	character_look.action(delta)
