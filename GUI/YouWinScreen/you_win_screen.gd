extends Control
class_name YouWinScreen

@onready var level_manager: LevelManager
@onready var coins_collected_label: Label = %CoinsCollectedLabel


func _ready() -> void:
	level_manager = get_tree().get_first_node_in_group("level_manager")
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
	coins_collected_label.text = "Coins: %s/%s" % [level_manager.coins_collected, level_manager.max_coins]
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(0,-1000), 0)
	tween.tween_property(self, "position", Vector2(0,0), .5)
