extends Node3D

@onready var level_manager: Node = %LevelManager

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.owner.is_in_group("player"):
		var player : Player = body.owner
		player.marble.global_position = level_manager.spawn_location
