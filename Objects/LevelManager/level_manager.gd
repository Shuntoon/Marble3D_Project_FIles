extends Node
class_name LevelManager

signal level_finished

var spawn_location : Vector3
@onready var player: Node3D = %Player

func _ready() -> void:
	spawn_location = player.global_position
