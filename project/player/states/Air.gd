extends PlayerState

var velocity := Vector3.ZERO
var jump_impulse


func enter(msg: Dictionary = {}) -> void:
	match msg:
		{ "velocity": var v, "jump_impulse": var ji}:
			_parent.velocity = v + Vector3(0,ji,0)
	_parent.enter()

func exit() -> void:
	_parent.exit()

func unhandled_input(event: InputEvent) -> void:
	_parent.unhandled_input(event)

func physics_process(delta: float) -> void:
	_parent.physics_process(delta)
	if player.is_on_floor():
		_state_machine.transition_to("Move/Idle")
	elif player.is_on_ceiling():
		_parent.velocity.y = 0
