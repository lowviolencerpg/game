extends Node
class_name Minigame, "res://assets/editor/icons/minigame-manager/minigame.png"

signal minigame_finished(message)

func start(message: Dictionary = {}) -> Dictionary:
	return {}

func end() -> void:
	emit_signal("minigame_finished", {})
