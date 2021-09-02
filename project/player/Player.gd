extends KinematicBody
class_name Player

export var gravity = Vector3.DOWN * 10
export var speed = 4
export var rotation_speed = 0.85

var velocity = Vector3.ZERO

func _ready() -> void:
	get_tree().call_group_flags(2, "player_state", "set_player_reference", self)

# onready var mesh = $MeshHolder
# onready var camera = $CameraTarget/PlayerCamera
