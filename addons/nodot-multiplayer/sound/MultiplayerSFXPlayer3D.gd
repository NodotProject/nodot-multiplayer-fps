@tool
## A multiplayer sound effect player with randomization and trigger options
class_name MultiplayerSFXPlayer3D extends SFXPlayer3D

## Loads, caches and plays the audio file at the path argument. Use `sfx_root_path` to prefix the path.
func action(index: int = -1) -> void:
	rpc("rpc_action", index)

@rpc("call_local")
func rpc_action(index: int = -1) -> void:
	if !enabled: return
	var sfx_size: int = sfx.size()
	if sfx_size <= 0: return
	
	var stream: AudioStream = sfx[0]
	if index >= 0:
		stream = sfx[index]
	else:
		var random_index: int = rng.randi_range(0, sfx_size - 1)
		stream = sfx[random_index]

	set_stream(stream)
	if tweak_pitch > 0.0:
		_tweak_pitch()
	play()
	emit_signal("played")
