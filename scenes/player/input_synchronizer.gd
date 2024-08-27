class_name PlayerInput extends BaseNetInput

@export var kb: FirstPersonKeyboardInput
@export var mouse: FirstPersonMouseInput

@onready var character: FirstPersonCharacter = get_parent()

var direction := Vector2.ZERO
var look_angle := Vector2.ZERO

func action():
	if is_multiplayer_authority():
		prints(character.name, get_multiplayer_authority())
		character.set_current_player()
	
func _gather():
	direction = kb.direction()
	look_angle = mouse.look_angle(1.0 / NetworkTime.tickrate)
