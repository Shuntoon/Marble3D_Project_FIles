extends Node3D
class_name Player 

signal level_finished
signal ability_collected(ability : Marble.ABILITIES)

@onready var marble: RigidBody3D = $Marble
@onready var camera: Node3D = $CameraContainer


func _on_level_finished() -> void:
	camera.smooth_camera_tolerance = .01
	camera.level_finished = true
	marble.can_move = false
	marble.level_finished = true
