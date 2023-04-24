class_name GridItem extends Node
tool

export var _grid_position : Vector2

func _ready():
	update_position()

func _get_configuration_warning():
	var warning = ""
	
	if get_parent() is GridMap2D:
		pass
	else:
		warning = "Parent node is not GridMap2D"
	
	return warning

func update_position():
	var _parent = get_parent()
	if _parent is GridMap2D:
		for node in get_children():
			var pos = _grid_position
			var size = _parent._cell_size
			node.position = pos * size + size / 2

func set_position(pos : Vector2):
	_grid_position = pos

func move(vec : Vector2):
	_grid_position += vec
	update_position()
