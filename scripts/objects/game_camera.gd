class_name GameCamera extends Camera2D
tool

export (NodePath) var _target_path
var _target = null

func _ready():
	if _target_path:
		set_target(get_node(_target_path))
	
	if self.current:
		CameraManager.set_camera(self)

func _process(delta):
	if _target:
		position = _target.position

func set_target(obj):
	_target = obj
	
func reset_target():
	set_target(null)
