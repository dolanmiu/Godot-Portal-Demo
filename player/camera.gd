extends Camera3D

@export_range(0.0, 1.0) var sensitivity: float = 0.25
@onready var character = $CharacterBody3D

var _mouse_position = Vector2(0, 0)
var _total_pitch = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		_mouse_position *= sensitivity
		var yaw = _mouse_position.x
		var pitch = _mouse_position.y
		_mouse_position = Vector2(0, 0)

		pitch = clamp(pitch, -90 - _total_pitch, 90 - _total_pitch)
		_total_pitch += pitch

		owner.rotate_y(deg_to_rad(-yaw))
		rotate_object_local(Vector3(1, 0, 0), deg_to_rad(-pitch))


func _input(event):
	if event is InputEventMouseMotion:
		_mouse_position = event.relative

	if event is InputEventMouseButton:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	if event is InputEventKey:
		match event.keycode:
			KEY_ESCAPE:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
