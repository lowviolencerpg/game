extends Node
class_name Minigame, "res://assets/editor/icons/minigame-manager/minigame.png"

export var minigame_name: String = "minigame"

signal minigame_finished(message)

func _ready() -> void:
	self.add_to_group("minigame")

func start(message: Dictionary = {}) -> Dictionary:
	return message

# When defining your own minigame, overwrite this method.
# Your minigame should emit the signal "minigame_finished" with a single Dictionary value with the resulting information
func end() -> void:
	emit_signal("minigame_finished", {a="1"})
	MinigameManager.unload_minigame()
