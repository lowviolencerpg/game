extends Node

var _minigameNode : Node

func _init() -> void:
	add_to_group("minigame_manager")

func _ready() -> void:
	var minigame_node = Node.new()
	minigame_node.name = "Minigame-LoadPoint"
	add_child(minigame_node)
	_minigameNode = minigame_node

var registered_minigames: Dictionary = {}

func register_minigame(unique_name: String, minigame_resource: String) -> void:
	var loaded_minigame_resource = load(minigame_resource)
	if loaded_minigame_resource:
		registered_minigames[unique_name] = minigame_resource

func load_minigame(name: String, message: Dictionary = {}) -> Dictionary:
	if not registered_minigames.get(name):
		return {}
	var minigame_path = registered_minigames.get(name) as String
	var minigame_resource = load(minigame_path)
	var minigame = minigame_resource.instance() as Minigame
	_minigameNode.add_child(minigame)
	var initialization_response = minigame.start(message)
	return {
		minigame_path = minigame.get_path(),
		response = initialization_response
	}

func unload_minigame() -> void:
	var loaded_minigame = _minigameNode.get_child(0)
	if loaded_minigame.is_in_group("minigame"):
		loaded_minigame.queue_free()

