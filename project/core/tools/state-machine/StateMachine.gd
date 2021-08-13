extends Node
class_name StateMachine, "res://assets/editor/icons/state-machine/state-machine.png"

signal transitioned(target_state_path, message)

export var initial_state: = NodePath()

func _ready() -> void:
	self.add_to_group("state_machine")

var state: State = null setget set_state

func set_state(value: State) -> void:
	state = value

func transition_to(target_state_path: String, message: Dictionary = {}) -> void:
	if not has_node(target_state_path):
		return
	var target_state = get_node(target_state_path)
	state.exit()
	self.state = target_state
	state.enter(message)
	emit_signal("transitioned", target_state_path, message)


# Delegate logic to the current state

func _unhandled_input(event: InputEvent) -> void:
	state.unhandled_input(event)

func _process(delta: float) -> void:
	state.process(delta)

func _physics_process(delta: float) -> void:
	state.physics_process(delta)
