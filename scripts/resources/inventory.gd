class_name Inventory extends Resource

var _cards_list = Array()
var _money = 0

func get_cards_list() -> Array:
	return _cards_list
	

func clear_cards_list():
	_cards_list.clear()
	
func add_card(item):
	_cards_list.append(item)
	
func add_random_cards(count, list):
	for i in count:
		var index = randi() % list.size()
		var item = list[index]
		add_card(item)
		
func use_card(item):
	_cards_list.erase(item)
	item.execute_actions()
	
func get_cards_count():
	return _cards_list.size()
	
func get_money():
	return _money
