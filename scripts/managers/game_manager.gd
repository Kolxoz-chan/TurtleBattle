extends Node

# Timer
var _max_timer_value
var _timer_value

# Cards
var _cards_list
var _cards_count

func init_cards(count, list):
	_cards_count = count
	_cards_list = list

func init_timer(value):
	_max_timer_value = value
	reset_timer()
	
func is_timeout():
	return _timer_value <= 0
	
func reset_timer():
	_timer_value = _max_timer_value
	
func update_timer(value):
	_timer_value += value
	
func get_timer_value():
	return _timer_value
	
func get_max_cards():
	return _cards_count
	
func get_cards_list():
	return _cards_list
	
func regenerate_cards():
	var character = CharactersManager.get_current_character()
	var inventory = InventoryManager.get_inventory(character)
	var count = inventory.get_cards_count()
	print(count)
	inventory.add_random_cards(_cards_count - count, _cards_list)
	UiManager.get_ui("ui_cards").update_data()

func next_character():
	var character = CharactersManager.next_character()
	character.reset_steps()
	
	CameraManager.get_camera().set_target(character)
	GameManager.reset_timer()
	UiManager.get_ui("ui_hud").update_data()
	

