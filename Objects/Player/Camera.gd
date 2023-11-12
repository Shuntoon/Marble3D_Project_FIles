extends Node3D

@export_category("Configurables")
@export var cam_v_max : float = 110.0
@export var cam_v_min : float = -75.0
@export var h_sensitivity : float = 0.1
@export var v_sensitivity : float = 0.1
@export var h_acceleration : float = 15.0
@export var v_acceleration : float = 15.0

var camrot_h : float = 0.0
var camrot_v : float = 0.0

@onready var marble = $"../Marble"
@onready var h_rotation = $HRotation
@onready var v_rotation = $HRotation/VRotation

# Called when the node enters the scene tree for the first time.
func _ready():
	#hide mouse at start
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.
	
func _physics_process(delta):
	global_position = lerp(global_position, marble.get_node("MeshInstance3D").global_position,.3)
	
	camrot_v = clamp(camrot_v, cam_v_min, cam_v_max)
	
	h_rotation.rotation_degrees.y = lerp(h_rotation.rotation_degrees.y, camrot_h, delta * h_acceleration)
	v_rotation.rotation_degrees.x = lerp(v_rotation.rotation_degrees.x, camrot_v, delta * v_acceleration)
	rotation_degrees.z = 0
	
	
func _input(event):
	if event is InputEventMouseMotion:
		camrot_h += -event.relative.x * h_sensitivity
		camrot_v += -event.relative.y * v_sensitivity

