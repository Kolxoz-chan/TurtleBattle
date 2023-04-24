class_name Mode extends Node

export (Array, Resource) var _cards_list
export (int, 1, 10) var _cards_count = 5
export (int, 2, 20) var _characters_count = 4
export (Vector2) var _map_size

func _ready():
	# Settings
	randomize()
	
	if _map_size.x <= 0 or _map_size.y <= 0:
		printerr("ERROR. The map size must be greater than zero")
		return
		
	if _cards_list.size() <= 0:
		printerr("ERROR. Cards list is empty")
		return
	
	$game_field.init_map(_map_size, Vector2(64, 64))
	CharactersManager.init_characters(_characters_count, _map_size)
	
	var list = CharactersManager.get_characters_list()
	for character in list:
		var inventory = InventoryManager.init_inventory(character)
		inventory.fill_random_cards(_cards_count, _cards_list)
		
	$ui/ui_cards.update_data()
		
		
		
		
		
		

