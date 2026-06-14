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

func _ready() -> void:
	max_coins = coins.get_child_count()
	spawn_location = player.global_position


func _on_checkpoint_reached(position) -> void:
	spawn_location = position
	pass # Replace with function body.


func _on_coin_collected() -> void:
	coins_collected += 1
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("quit"):
		get_tree().quit()
		
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
