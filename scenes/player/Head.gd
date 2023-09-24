extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Area3D.connect("body_entered", _function_signal_handler)
