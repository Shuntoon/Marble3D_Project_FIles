extends RayCast3D

@onready var marble = $"../Marble"
@onready var mesh_instance_3d = $"../Marble/MeshInstance3D"

func _physics_process(delta):
	global_position = mesh_instance_3d.global_position
	
	if is_colliding():
		marble.grounded = true
	else:
		marble.grounded = false
