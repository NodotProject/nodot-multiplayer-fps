extends Marker3D

func _ready():
	MultiplayerManager.spawn_points.add(self)
