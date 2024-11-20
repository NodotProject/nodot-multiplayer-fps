class_name PlayerInput extends BaseNetInput

@export var player_models: Array[Node]
@export var kb: MultiplayerFirstPersonKeyboardInput
@export var mouse: MultiplayerFirstPersonMouseInput
@export var jump: MultiplayerCharacterJump3D
@export var interact3d: MultiplayerInteraction3D
@export var multiplayer_mover: MultiplayerCharacterMove3D
@export var first_person_items: MultiplayerFirstPersonItemsContainer

@onready var character: MultiplayerFirstPersonCharacter = get_parent()

var direction := Vector2.ZERO
var look_angle := Vector2.ZERO
var sprint := false
var jump_pressed := false
var reload_pressed := false
var interact := false
var mouse_action := ""

func action():
	if is_multiplayer_authority():
		character.set_current_player()
		kb.enable()
		mouse.enable()
		for model in player_models:
			model.visible = false
	
func _gather():
	var mouse_input: Dictionary = mouse.get_input(NetworkTime.ticktime)
	var movement = multiplayer_mover.get_input()
	look_angle = mouse_input.look_angle
	mouse_action = mouse_input.mouse_action
	sprint = movement.sprint
	jump_pressed = movement.jump
	direction = kb.get_input()
	interact = interact3d.get_input()
	reload_pressed = first_person_items.get_input()
