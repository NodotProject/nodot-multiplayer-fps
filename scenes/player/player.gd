extends MultiplayerFirstPersonCharacter

@export var display_name: String = "": set = _set_display_name
@export var player_model: MeshInstance3D

func _after_ready():
	var next_position = MultiplayerManager.spawn_points.get_next_item().global_position
	global_position = next_position
		
	display_name = str(name)

func _set_display_name(new_display_name: String):
	display_name = new_display_name
	$DisplayName.text = new_display_name
