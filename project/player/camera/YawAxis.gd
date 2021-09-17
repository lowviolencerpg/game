extends Spatial

var mouse_delta : float = 0

export(float) var _sensitivity = 50
export(float) var _recenter_speed = 30.0
export(float) var _recenter_tolerance = 6.0 # In degrees to each side

func _process(delta: float) -> void:
	var action_delta = Input.get_action_strength('camera_right') - Input.get_action_strength('camera_left')
	var total_delta = mouse_delta + action_delta
	if total_delta != 0:
		rotation_degrees.y += total_delta * delta * _sensitivity
		mouse_delta = 0
	else:
		rotation_degrees.y += calculate_recenter_direction() * delta


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var mouse_event = event as InputEventMouseMotion
		mouse_delta = mouse_event.relative.x

func calculate_recenter_direction() -> float:
	var direction = 1
	if rotation_degrees.y > 0 and rotation_degrees.y < 180:
		direction = -1
	if rotation_degrees.y > _recenter_tolerance or rotation_degrees.y < -_recenter_tolerance:
		return _recenter_speed * direction
	else:
		return 0.0
