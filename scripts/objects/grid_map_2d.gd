class_name GridMap2D extends Node2D
tool

var _data : Array

export var _field_size = Vector2(10, 10)
export var _cell_size = Vector2(64, 64)

func _ready():
	pass
	
func init_map(field_size : Vector2, cell_size : Vector2):
	_field_size = field_size
	_cell_size = cell_size
	
	for y in _field_size.y:
		_data.append([])
		for x in _field_size.x:
			_data[y].append(null)
	
func set_item(pos : Vector2, item):
	if _data.size() > pos.y:
		if _data[pos.y].size() > pos.x:
			_data[pos.y][pos.x] = item
			item.set_position(pos)
		
