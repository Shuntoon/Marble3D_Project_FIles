extends Node3D
class_name AbilityCollectable

@onready var corkscrew: Node3D = $Corkscrew
@onready var propeller: Node3D = $Propeller
@onready var collection_collision: CollisionShape3D = %CollectionCollision

@export var ability : Marble.ABILITIES
@export var deactivation_time : float = 3.0

func _ready() -> void:
	corkscrew.hide()
	propeller.hide()

	match ability:
		Marble.ABILITIES.SPRING:
			corkscrew.show()
		Marble.ABILITIES.PROPELLER:
			propeller.show()


func _on_collection_area_body_entered(body: Node3D) -> void:
	if body.owner.is_in_group("player"):
		var player : Player = body.owner
		player.ability_collected.emit(ability)
		
		deactivate_and_reactivate(deactivation_time)
		
func deactivate_and_reactivate(time : float) -> void:
	hide_meshes()
	collection_collision.disabled = true
	
	#this is a timer
	await get_tree().create_timer(time).timeout
	
	show_mesh()
	collection_collision.disabled = false

func hide_meshes() -> void:
	corkscrew.hide()
	propeller.hide()
	

func show_mesh() -> void:
	match ability:
		Marble.ABILITIES.SPRING:
			corkscrew.show()
		Marble.ABILITIES.PROPELLER:
			propeller.show()
