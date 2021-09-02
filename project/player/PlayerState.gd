extends State
class_name PlayerState, "res://assets/editor/icons/state-machine/state.png"

onready var player : Player = self._state_machine.get_parent()

# export(NodePath) var mesh_nodepath
# onready var mesh : Node = get_node(mesh_nodepath)


func physics_process(delta: float) -> void:
	player.velocity += player.gravity * delta
	# get_input(delta)
	player.velocity = player.move_and_slide(player.velocity, Vector3.UP)
