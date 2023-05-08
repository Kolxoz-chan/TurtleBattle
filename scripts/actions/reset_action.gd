class_name ResetAction extends Action

func exec():
	var character = CharactersManager.get_current_character()
	var inventory = InventoryManager.get_inventory(character)
	var ui_cards = UiManager.get_ui("ui_cards")
	
	var count = GameManager.get_max_cards()
	var list = GameManager.get_cards_list()
	
	inventory.clear_cards_list()
	inventory.add_random_cards(count, list)
	ui_cards.update_data()
	
