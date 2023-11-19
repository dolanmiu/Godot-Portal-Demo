extends CharacterBody3D

var _direction: Vector3 = Vector3.ZERO
const _SENSITIVITY: int = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if not event is InputEventKey:
		return
		
	if event.is_echo():
		return

	if event.is_action_pressed("move_up"):
		_direction.z -= 1
		print('pressed')
	if event.is_action_released("move_up"):
		_direction.z += 1

	if event.keycode == KEY_A:
		if event.pressed:
			_direction.x -= 1
		else:
			_direction.x += 1

	if event.keycode == KEY_S:
		if event.pressed:
			_direction.z += 1
		else:
			_direction.z -= 1

	if event.keycode == KEY_D:
		if event.pressed:
			_direction.x += 1
		else:
			_direction.x -= 1
	print(_direction)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = _direction * delta * _SENSITIVITY

		
	move_and_slide()
	pass
