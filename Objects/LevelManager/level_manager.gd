extends Node
class_name LevelManager

signal level_finished
signal checkpoint_reached(position : Vector3)
signal coin_collected

var spawn_location : Vector3
var coins_collected : int = 0
var max_coins : int

@onready var player: Node3D = %Player
@onready var coins: Node3D = %Coins
@onready var pause_screen: Control = $"../CanvasLayer/PauseScreen"

func _ready() -> void:
	max_coins = coins.get_child_count()
	spawn_location = player.global_position
	get_tree().paused = false


func _on_checkpoint_reached(position) -> void:
	spawn_location = position
	pass # Replace with function body.


func _on_coin_collected() -> void:
	coins_collected += 1
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("quit"):
		pause_screen.show()
		get_tree().paused = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
