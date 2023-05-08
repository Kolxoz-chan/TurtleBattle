class_name Character extends Area2D
tool

enum Dirrection {TOP = 0, RIGHT, BOTTOM, LEFT}

export (Dirrection) var _dirrection;

var _max_steps_count
var _steps_count

func _ready():
	set_dirrection(_dirrection)
	
func rotate_quarter(value):
	_dirrection += value
	
	if _dirrection > 0:
		set_dirrection(_dirrection % Dirrection.size())
	else:
		set_dirrection((Dirrection.size() - 1) + (_dirrection % Dirrection.size()))

func get_dirrection():
	return _dirrection
	
func add_step(value):
	_steps_count += value
	
func init_steps(value):
	_max_steps_count = value

func is_move_possible():
	return _steps_count > 0

func reset_steps():
	_steps_count = _max_steps_count
	
func get_steps_count():
	return _steps_count 

func set_dirrection(dirr):
	_dirrection = dirr
	if dirr == Dirrection.LEFT:
		rotation_degrees = -90
	elif dirr == Dirrection.RIGHT:
		rotation_degrees = 90
	elif dirr == Dirrection.TOP:
		rotation_degrees = 0
	elif dirr == Dirrection.BOTTOM:
		rotation_degrees = 180
