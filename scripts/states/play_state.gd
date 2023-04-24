class_name PlayState extends State

export var _motion_speed = 60

func on_input(event):
	pass

func on_update(delta):
	
	# Motion
	var vec = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		vec += Vector2.UP
	if Input.is_action_pressed("ui_down"):
		vec += Vector2.DOWN
	if Input.is_action_pressed("ui_left"):
		vec += Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		vec += Vector2.RIGHT
	if vec != Vector2.ZERO:
		CameraManager.move_camera(vec * delta * _motion_speed)
	
