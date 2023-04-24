class_name Inventory extends Resource

var _cards_list = Array()
var _money = 0

func get_cards_list() -> Array:
	return _cards_list

func clear_cards_list():
	_cards_list.clear()
	
func add_card(item : CardItem):
	_cards_list.append(item)
	
func fill_random_cards(count, list):
	for i in count:
		var item = list[randi() % list.size()]
		add_card(item)
