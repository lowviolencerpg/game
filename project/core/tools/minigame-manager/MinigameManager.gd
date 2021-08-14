extends Node

var _minigameNode : Node

func _ready() -> void:
	self.add_to_group("minigame_manager")
	var minigame_node = Node.new()
	minigame_node.name = "Minigame-LoadPoint"
	self.add_child(minigame_node)
	_minigameNode = minigame_node

var registered_minigames: Dictionary = {}

func register_minigame(unique_name: String, minigame_resource: String) -> void:
	var loaded_minigame_resource = load(minigame_resource)
	var minigame = loaded_minigame_resource.instance()
	_minigameNode.add_child(minigame)

func load_minigame(name: String, message: Dictionary = {}) -> Dictionary:
	if not registered_minigames.get(name):
		return {}
	var minigame_path = registered_minigames.get(name) as Minigame
	var minigame = minigame_path.instance()
	_minigameNode.add_child(minigame)
	var initialization_response = minigame.start(message)
	return {
		minigame_path = minigame.get_path(),
		response = initialization_response
	}

