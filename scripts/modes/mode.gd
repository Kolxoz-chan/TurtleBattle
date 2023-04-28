class_name Mode extends Node

export (Array, Resource) var _cards_list
export (int, 1, 10) var _cards_count = 5
export (int, 2, 20) var _characters_count = 4
export (Vector2) var _map_size
export (int) var _max_timer_value = 30;

var _timer_value = 0;

func _ready(): 
	# Settings
	randomize()
	
	# Check on error
	if _map_size.x <= 0 or _map_size.y <= 0:
		printerr("ERROR. The map size must be greater than zero")
		return
		
	if _cards_list.size() <= 0:
		printerr("ERROR. Cards list is empty")
		return
	
	# Init map
	$game_field.init_map(_map_size, Vector2(64, 64))
	
	# Init characters
	CharactersManager.init_characters(_characters_count, _map_size)
	
	# Init inventory
	var list = CharactersManager.get_characters_list()
	for character in list:
		var inventory = InventoryManager.init_inventory(character)
		inventory.fill_random_cards(_cards_count, _cards_list)
		
	# Init gui
	$ui/ui_cards.update_data()
	
	# Init timer
	_timer_value = _max_timer_value
	update_timer()
	$timer.start()
		
func update_timer():
	if _timer_value < 0:
		var character = CharactersManager.next_character()
		$game_camera.set_target(character)
		_timer_value = _max_timer_value
	$ui/ui_hud.set_time(_timer_value)
		
func _on_timer_timeout():
	_timer_value -= 1
	update_timer()
	
