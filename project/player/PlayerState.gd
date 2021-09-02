extends State
class_name PlayerState, "res://assets/editor/icons/state-machine/state.png"

func _init() -> void:
	add_to_group("player_state")

var player : Player
func set_player_reference(playerNode: Player):
	player = playerNode
	print("Set playernode")

func physics_process(delta: float) -> void:
	player.velocity += player.gravity * delta
	# get_input(delta)
	player.velocity = player.move_and_slide(player.velocity, Vector3.UP)
