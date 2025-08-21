extends Control
class_name YouWinScreen

@onready var level_manager: Node = %LevelManager


func _ready() -> void:
	level_manager.connect("level_finished", _on_level_finished)

func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_continue_button_pressed() -> void:
	pass # Replace with function body.


func _on_main_menu_butoon_pressed() -> void:
	pass # Replace with function body.

func _on_level_finished() -> void:
	visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(0,-1000), 0)
	tween.tween_property(self, "position", Vector2(0,0), .5)
