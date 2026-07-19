extends Node
class_name RotationComponent

@export var rotation_speed : float = 100.0

func _ready() -> void:
	rotation_speed = randf_range(rotation_speed - 2, rotation_speed + 2)
	
func _process(delta: float) -> void:
	get_parent().rotation_degrees.y += rotation_speed * delta
