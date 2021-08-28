extends Node
class_name PlayerCamera, "res://assets/editor/icons/player-camera/player-camera.png"

export(NodePath) var _camera_look_target_path
onready var camera_look_target : Node = get_node(_camera_look_target_path)


onready var yaw_axis := $YawAxis
onready var pitch_axis := $YawAxis/PitchAxis
onready var spring_arm := $YawAxis/PitchAxis/SpringArm
onready var camera := $YawAxis/PitchAxis/SpringArm/Camera

func _camera_look_at_target():
	camera.look_at(camera_look_target.global_transform.origin, Vector3.UP)
	pass

func _process(delta: float) -> void:
	_camera_look_at_target()
