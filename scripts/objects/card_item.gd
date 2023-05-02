extends Panel
tool

var _mouse_over = false

export (Resource) var _item = null

func _ready():
	connect("mouse_entered", self, "_set_mouse_over", [true])
	connect("mouse_exited",  self, "_set_mouse_over", [false])
	
	if _item:
		$VBoxContainer/card_name.text = _item.title
		$VBoxContainer/card_description.text = _item.description
		$VBoxContainer/CenterContainer/card_icon.texture = _item.icon

func set_item(item):
	_item = item

func _set_mouse_over(value):
	_mouse_over = value
		
func _get_configuration_warning():
	if _item == null:
		return "Card item has not resource"
		
	return ""

func _on_CardItem_gui_input(event):
	if CharactersManager.is_players_turn():
		if event is InputEventMouseButton:
			if _item and event.pressed:
				_item.execute_actions()
				self.queue_free()
