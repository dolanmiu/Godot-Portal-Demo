extends Camera3D

@onready var _player: Node3D = get_tree().root.get_node("Main/Player/Camera")
@onready var _other_portal: Node3D = get_tree().root.get_node("Main/BluePortal")
@onready var _portal: Node3D = get_parent().get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _physics_process():
	var diff = _player.global_position - _portal.global_position
	print(diff)
	position = _other_portal.global_position - diff
	look_at(_other_portal.global_position)
