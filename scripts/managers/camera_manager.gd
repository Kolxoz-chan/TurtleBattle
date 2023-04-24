extends Node

var _camera : GameCamera

func set_camera(camera : GameCamera):
	_camera = camera
	
func get_camera():
	return _camera
	
func move_camera(vec : Vector2):
	if _check_camera():
		_camera.reset_target()
		_camera.translate(vec)
		
	
func _check_camera():
	if _camera != null and _camera is GameCamera:
		return true
	else:
		printerr("ERROR: Camera is not setted")
		return false

