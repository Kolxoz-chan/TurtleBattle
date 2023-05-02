class_name GameCamera extends Camera2D
tool

export var _speed = 80
export (NodePath) var _target_path = null
var _target : Node2D

func _ready():
	if _target_path:
		set_target(get_node(_target_path))
	
	if _target:
		position = _target.position
	
	if self.current:
		CameraManager.set_camera(self)

func _process(delta):
	if _target and _target.position != position:
		if position.distance_to(_target.position) > _speed * delta:
			var dir = position.direction_to(_target.position)
			position += dir * delta * _speed
		else:
			position = _target.position

func set_target(obj):
	_target = obj
	
func reset_target():
	set_target(null)
