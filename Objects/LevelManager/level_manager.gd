extends Node
class_name LevelManager

signal level_finished
signal checkpoint_reached(position : Vector3)

var spawn_location : Vector3
@onready var player: Node3D = %Player

func _ready() -> void:
	spawn_location = player.global_position


func _on_checkpoint_reached(position) -> void:
	spawn_location = position
	pass # Replace with function body.
