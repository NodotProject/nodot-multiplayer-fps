extends Node3D

@export var character: FirstPersonCharacter
@export var animation: AnimationTree
@export var speed: float = 1.0

func _process(delta: float):
	var direction_3d = character.velocity.direction_to(Vector3.ZERO)
	var direction_2d = Vector2(direction_3d.x, direction_3d.z)

	# Assuming there's an AnimationTree node and it has a parameter called "parameter_name"
	# You will interpolate towards `direction_2d`
	var current_value = animation.get("parameters/Move/blend_position")
	var target_value = direction_2d
	var interpolated_value = lerp(current_value, direction_2d, delta * speed) # Speed controls how fast to interpolate

	animation.set("parameters/Move/blend_position", interpolated_value)
