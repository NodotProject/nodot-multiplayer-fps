@icon("../../icons/mouse.svg")
## Adds mouse support to the multiplayer first person character
class_name MultiplayerFirstPersonMouseInput extends FirstPersonMouseInput

## Buffer for input events
var input_buffer: Array = []

func _physics_process(delta: float) -> void:
	pass

## Process the buffered input and get the look_angle
func get_input(delta: float) -> Dictionary:
	var look_angle: Vector2 = Vector2.ZERO
	var mouse_action: String = ""
	
	if Input.is_action_pressed(action_action):
		input_buffer.append({"type": "mouse_action", "action": "action"})
	elif Input.is_action_just_released(action_action):
		input_buffer.append({"type": "mouse_action", "action": "release_action"})
	elif Input.is_action_pressed(zoom_action):
		input_buffer.append({"type": "mouse_action", "action": "zoom"})
	elif Input.is_action_just_released(zoom_action):
		input_buffer.append({"type": "mouse_action", "action": "zoomout"})
	
	for entry in input_buffer:
		if entry["type"] == "mouse_motion":
			var mouse_movement: Vector2 = entry["event"]
			look_angle.y -= mouse_movement.x * InputManager.mouse_sensitivity * delta
			look_angle.x -= mouse_movement.y * InputManager.mouse_sensitivity * delta
		elif entry["type"] == "mouse_action":
			mouse_action = entry["action"]

	# Clear the buffer after processing
	input_buffer.clear()

	# Return final processed input
	return {
		"look_angle": Vector2(look_angle.y, look_angle.x),
		"mouse_action": mouse_action
	}
