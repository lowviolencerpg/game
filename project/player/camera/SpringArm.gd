extends SpringArm

onready var mouse_target_zoom : float = spring_length

export(Dictionary) var _zoom_limits := {
	"minimum": 3,
	"maximum": 10
}

export(float) var _zoom_sensitivity := 0.5

func _process(delta: float) -> void:
	mouse_target_zoom += (Input.get_action_strength('camera_zoom_out') - Input.get_action_strength('camera_zoom_in')) * _zoom_sensitivity
	var clamped_zoom = clamp(mouse_target_zoom, _zoom_limits.minimum, _zoom_limits.maximum)
	var interpolated_zoom = lerp(spring_length, clamped_zoom, 0.2)
	spring_length = interpolated_zoom

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		if mouse_event.pressed:
			match mouse_event.button_index:
				BUTTON_WHEEL_UP:
					mouse_target_zoom -= _zoom_sensitivity
				BUTTON_WHEEL_DOWN:
					mouse_target_zoom += _zoom_sensitivity
