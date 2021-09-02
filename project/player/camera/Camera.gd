extends Spatial
class_name PlayerCamera, "res://assets/editor/icons/player-camera/player-camera.png"

export var follow_speed := 3.0

onready var _camera := $YawAxis/PitchAxis/SpringArm/CameraLookAt

var target: Position3D

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	set_as_toplevel(true)
	yield(owner, "ready")
	target = get_parent()

func _physics_process(delta: float) -> void:
	if target:
		var target_position = target.global_transform
		global_transform = global_transform.interpolate_with(target_position, follow_speed * delta)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('ui_cancel'):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		if mouse_event.pressed:
			match mouse_event.button_index:
				BUTTON_LEFT:
					Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
