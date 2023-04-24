extends Control

var card_item = preload("res://prefabs/ui/CardItem.tscn")

func set_cards(list : Array):
	clear_cards()
	fill_container(list)
	
func add_card(card):
	var obj = card_item.instance()	
	obj.set_item(card)
	$vbox/hbox.add_child(obj)
	
	
func fill_container(list):
	for card in list:
		add_card(card)
	
	
func clear_cards():
	var arr = $vbox/hbox.get_children();
	for obj in arr:
		obj.queue_free()
		
		
func update_data():
	clear_cards()
	
	var player = CharactersManager.get_player()
	var inventory = InventoryManager.get_inventory(player)
	var list = inventory.get_cards_list()
	
	fill_container(list)
	
