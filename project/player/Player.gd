tool
extends KinematicBody
class_name Player

onready var state_machine : StateMachine = $StateMachine
onready var mesh_holder : Spatial = $MeshHolder
onready var camera : Camera = $CameraTarget/PlayerCamera._camera
