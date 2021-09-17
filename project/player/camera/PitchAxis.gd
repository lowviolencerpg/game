extends Spatial

export(Dictionary) var _pitch_limit := {
	"minimum": -60,
	"maximum": 30,
}

export(float) var _sensitivity = 30

var mouse_delta : float = 0

func _process(delta: float) -> void:
	var action_delta = Input.get_action_strength('camera_up') - Input.get_action_strength('camera_down')
	var total_delta = mouse_delta + action_delta
	if total_delta != 0:
		var new_angle = rotation_degrees.x + total_delta * _sensitivity * delta
		var clamped_angle = clamp(new_angle, _pitch_limit.minimum, _pitch_limit.maximum)
		rotation_degrees.x = clamped_angle
		mouse_delta = 0

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var mouse_event = event as InputEventMouseMotion
		mouse_delta = mouse_event.relative.y
