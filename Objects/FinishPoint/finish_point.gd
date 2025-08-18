extends Node3D

var level_manager : LevelManager

func _ready() -> void:
	level_manager = get_tree().get_first_node_in_group("level_manager")

func _on_finish_area_body_entered(body):
	if body.owner.is_in_group("player"):
		var camera = body.owner.get_node("CameraContainer")
		camera.smooth_camera_tolerance = .01
		camera.level_finished = true
		body.can_move = false
		body.level_finished = true
		
		level_manager.level_finished.emit()
	pass # Replace with function body.
