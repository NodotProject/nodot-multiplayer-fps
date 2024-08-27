class_name PlayerInput extends BaseNetInput

@export var player_model: MeshInstance3D
@export var kb: MultiplayerFirstPersonKeyboardInput
@export var mouse: MultiplayerFirstPersonMouseInput
@export var jump: MultiplayerCharacterJump3D
@export var first_person_items: MultiplayerFirstPersonItemsContainer

@onready var character: MultiplayerFirstPersonCharacter = get_parent()

var direction := Vector2.ZERO
var look_angle := Vector2.ZERO
var jump_pressed := false
var reload_pressed := false
var mouse_action := ""

func action():
	if is_multiplayer_authority():
		character.set_current_player()
		kb.enable()
		mouse.enable()
		player_model.visible = false
	
func _gather():
	var mouse_input: Dictionary = mouse.get_input(1.0 / NetworkTime.tickrate)
	look_angle = mouse_input.look_angle
	mouse_action = mouse_input.mouse_action
	direction = kb.get_input()
	jump_pressed = jump.get_input()
	reload_pressed = first_person_items.get_input()
