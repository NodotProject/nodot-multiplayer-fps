class_name MultiplayerFirstPersonCamera3D extends Camera3D

@export var smooth_factor: float = 10.0

@onready var head: Node3D = get_parent()

func _ready():
	global_transform = head.global_transform
	top_level = true
	
func _process(delta: float) -> void:
	global_transform.origin = global_transform.origin.lerp(head.global_transform.origin, delta * smooth_factor)
	global_rotation = head.global_rotation
