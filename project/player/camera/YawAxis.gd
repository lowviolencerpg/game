extends Spatial

var mouse_delta : float = 0

export(float) var _sensitivity = 10

func _process(delta: float) -> void:
	rotation_degrees.y += mouse_delta * delta * _sensitivity
	mouse_delta = 0

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var mouse_event = event as InputEventMouseMotion
		mouse_delta = mouse_event.relative.x
