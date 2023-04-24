class_name Character extends Area2D
tool

enum Dirrection {TOP = 0, RIGHT, BOTTOM, LEFT}

export (Dirrection) var _dirrection;

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
