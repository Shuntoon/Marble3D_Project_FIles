extends RigidBody3D
class_name Marble

@export var movement_speed : float = 385.0
@export var max_velocity : float = 7.5
@export var jump_power : float = 6.0
@export var finish_deceleration : float = .25

@export var spring_jump_power : float = 15.0

@onready var camera_3d = $"../CameraContainer/HRotation/VRotation/SpringArm3D/Camera3D"

enum ABILITIES {
	NONE,
	SPRING,
	PROPELLER
}

var current_ability : ABILITIES = ABILITIES.NONE

var grounded = false
var can_move = true
var level_finished = false

func _physics_process(delta):
	if can_move:
		movement(delta)
	
	if level_finished:
		gravity_scale = move_toward(gravity_scale,0.0, finish_deceleration * delta)
	
	if linear_velocity.x > max_velocity:
		linear_velocity.x = max_velocity
	if linear_velocity.x < -max_velocity:
		linear_velocity.x = -max_velocity
	if linear_velocity.z > max_velocity:
		linear_velocity.z = max_velocity
	if linear_velocity.z < -max_velocity:
		linear_velocity.z = -max_velocity
		
	if Input.is_action_just_pressed("use_ability"):
		if current_ability == ABILITIES.SPRING:
			spring_jump()
			current_ability = ABILITIES.NONE
		
	if Input.is_action_just_pressed("jump") and grounded:
		jump()
	
	
func movement(delta):
	var f_input = Input.get_action_raw_strength("backward") - Input.get_action_raw_strength("forward")
	var h_input = Input.get_action_raw_strength("right") - Input.get_action_raw_strength("left")
	
	var camera_tranform = camera_3d.get_camera_transform()
	
	var relative_camera_direction_z = camera_tranform.basis.z.normalized()
	var relative_camera_direction_x = camera_tranform.basis.x.normalized()
	
	var direction_f = f_input * relative_camera_direction_z
	var direction_h = h_input * relative_camera_direction_x
	
	apply_central_force(direction_f * movement_speed * delta)
	apply_central_force(direction_h * movement_speed * delta)
	
func jump():
	apply_central_impulse(Vector3.UP * jump_power)
	
func spring_jump():
	apply_central_impulse(Vector3.UP * jump_power)


func _on_player_ability_collected(ability) -> void:
	current_ability = ability
	pass # Replace with function body.
