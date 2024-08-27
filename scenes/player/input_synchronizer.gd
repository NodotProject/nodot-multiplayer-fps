class_name PlayerInput extends BaseNetInput

@export var player_model: MeshInstance3D
@export var kb: MultiplayerFirstPersonKeyboardInput
@export var mouse: MultiplayerFirstPersonMouseInput
@export var jump: MultiplayerCharacterJump3D

@onready var character: MultiplayerFirstPersonCharacter = get_parent()

var direction := Vector2.ZERO
var look_angle := Vector2.ZERO
var jump_pressed := false

func action():
	if is_multiplayer_authority():
		character.set_current_player()
		kb.enable()
		mouse.enable()
		player_model.visible = false
	
func _gather():
	direction = kb.get_input()
	look_angle = mouse.get_input(1.0 / NetworkTime.tickrate)
	jump_pressed = jump.get_input()
