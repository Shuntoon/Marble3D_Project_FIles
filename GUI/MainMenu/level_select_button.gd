extends Button
class_name LevelSelectButton

@export var level_name : String
@export var level_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = level_name
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	get_tree().change_scene_to_packed(level_scene)
	pass # Replace with function body.
