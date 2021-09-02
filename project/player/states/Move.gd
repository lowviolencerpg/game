extends PlayerState

export var max_speed := 12.0
export var move_speed := 10.0
export var gravity = -80.0
export var jump_impulse = 25
export(float, 0.1, 20.0, 0.1) var rotation_speed_factor := 0.5

var velocity := Vector3.ZERO

func enter(msg: Dictionary = {}) -> void:
	pass

func exit() -> void:
	pass

func unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		_state_machine.transition_to("Move/Air", {
			velocity = velocity,
			jump_impulse = jump_impulse
		})

onready var pos3d := $Position3D

func physics_process(delta: float) -> void:
	var movement_direction = adjust_move_with_camera(get_input_direction(), player.camera.global_transform)
	# Rotate
	if movement_direction:
		var target_direction := player.transform.looking_at(player.global_transform.origin + movement_direction, Vector3.UP)
		player.transform = player.transform.interpolate_with(target_direction, rotation_speed_factor * delta)
		pos3d.global_transform.origin = player.global_transform.origin + movement_direction
	# Movement
	velocity = calculate_velocity(velocity, movement_direction, delta)
	velocity = player.move_and_slide(velocity, Vector3.UP)

static func get_input_direction() -> Vector3:
	return Vector3(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		0,
		Input.get_action_strength("move_back") - Input.get_action_strength("move_front")
	)

func adjust_move_with_camera(input_direction: Vector3, camera_transform: Transform) -> Vector3:
	var forwards: Vector3 = camera_transform.basis.z  * input_direction.z
	var right: Vector3 = camera_transform.basis.x * input_direction.x
	var result:= forwards + right
	if result.length() > 1.0:
		result = result.normalized()
	result.y = 0
	return result

func calculate_velocity(current_velocity: Vector3, movement_direction: Vector3, delta:float) -> Vector3:
	var result := movement_direction * move_speed
	if result.length() > max_speed:
		result = result.normalized() * max_speed
	result.y = current_velocity.y + gravity * delta
	return result
