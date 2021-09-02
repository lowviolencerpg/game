tool
extends KinematicBody
class_name Player

onready var state_machine : StateMachine = $StateMachine
onready var mesh_holder = $MeshHolder
onready var camera = $CameraTarget/PlayerCamera._camera
