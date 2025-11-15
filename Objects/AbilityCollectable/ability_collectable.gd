extends Node3D
class_name AbilityCollectable

@onready var corkscrew: Node3D = $Corkscrew
@onready var propeller: Node3D = $Propeller

@export var ability : Marble.ABILITIES

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
		
		queue_free()
