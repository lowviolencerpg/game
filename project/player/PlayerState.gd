extends State
class_name PlayerState, "res://assets/editor/icons/state-machine/state.png"

var player : Player

func _ready() -> void:
	yield(owner, "ready")
	player = owner
