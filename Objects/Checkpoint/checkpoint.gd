extends Node3D
class_name Checkpoint

@onready var collision_shape_3d: CollisionShape3D = $Area3D/CollisionShape3D
@onready var spawn_point: Marker3D = $SpawnPoint
@onready var level_manager: Node = %LevelManager

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.owner.is_in_group("player"):
		level_manager.checkpoint_reached.emit(spawn_point.global_position)
		collision_shape_3d.set_deferred("disabled",true)
	pass # Replace with function body.
