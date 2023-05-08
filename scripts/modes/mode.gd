class_name Mode extends Node

export (Array, Resource) var _cards_list
export (int, 1, 10) var _cards_count = 5
export (int, 2, 20) var _characters_count = 4
export (Vector2) var _map_size
export (int) var _max_timer_value = 30;
export (int) var _max_steps_count = 3

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
		
		
	# Init game
	GameManager.init_timer(_max_timer_value)
	GameManager.init_cards(_cards_count, _cards_list)
	
	# Init scene
	SceneManager.init_scene(self)
	$game_field.init_map(_map_size, Vector2(64, 64))
	
	# Init characters
	CharactersManager.init_characters(_characters_count, _map_size)
	
	# Init inventory
	var list = CharactersManager.get_characters_list()
	for character in list:
		character.init_steps(_max_steps_count)
		character.reset_steps()
		
		var inventory = InventoryManager.init_inventory(character)
		inventory.add_random_cards(_cards_count, _cards_list)
		
	# Init timer
	GameManager.reset_timer()
	$timer.start()
		
	# Init gui
	UiManager.get_ui("ui_cards").update_data()
	UiManager.get_ui("ui_hud").update_data()
	
	
		
func _on_timer_timeout():
	GameManager.update_timer(-1)
	
	if GameManager.is_timeout():
		GameManager.regenerate_cards()
		GameManager.next_character()
	else:
		UiManager.get_ui("ui_hud").update_data()
	
 
