extends Camera

var look_target : Node

func set_target(target_nodepath:NodePath) -> void:
	look_target = get_node(target_nodepath)

func _process(delta: float) -> void:
	if look_target:
		_camera_look_at_target()

func _camera_look_at_target() -> void:
	look_at(look_target.global_transform.origin, Vector3.UP)
