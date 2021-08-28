extends Spatial
class_name PlayerCamera, "res://assets/editor/icons/player-camera/player-camera.png"

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed('ui_cancel'):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		if mouse_event.pressed:
			match mouse_event.button_index:
				BUTTON_LEFT:
					Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
