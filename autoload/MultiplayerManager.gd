extends Node

var spawn_root: Node
var spawn_points: UniqueSet

var player_scene: PackedScene = load("res://scenes/player/player.tscn")

func _ready():
	NetworkManager.connect("host_started", _host_connected)
	NetworkManager.connect("peer_connected", _peer_connected)

func _peer_connected(id: int, display_name: String):
	var player_instance = player_scene.instantiate()
	player_instance.name = str(id)
	player_instance.display_name = display_name
	spawn_root.add_child(player_instance)

func _host_connected(id: int, display_name: String):
	var map: PackedScene = load("res://scenes/maps/map.tscn")
	var map_instance = map.instantiate()
	spawn_root.add_child(map_instance)
	_peer_connected(id, display_name)
