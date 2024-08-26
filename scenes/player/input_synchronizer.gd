class_name PlayerInput extends BaseNetInput

@export var kb: FirstPersonKeyboardInput
@export var mouse: FirstPersonMouseInput

@onready var character: FirstPersonCharacter = get_parent()

var direction := Vector2.ZERO
var look_angle := Vector2.ZERO

func action():
	if is_multiplayer_authority():
		character.set_current_player()
	
func _gather():
	kb.action()
	mouse.action(0.166666)
	direction = character.direction
	look_angle = character.look_angle
