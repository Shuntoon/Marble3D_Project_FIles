extends Node3D
class_name Coin

@export var spin_rate : float = 1

var level_manager : LevelManager

@onready var coin_mesh: Node3D = $CoinMesh


func _ready() -> void:
	level_manager = get_tree().get_first_node_in_group("level_manager")
	
func _physics_process(delta: float) -> void:
	coin_mesh.rotation_degrees.y += spin_rate
	

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.owner.is_in_group("player"):
		level_manager.emit_signal("coin_collected")
		
		await get_tree().create_timer(.05).timeout
		queue_free()
	pass # Replace with function body.
