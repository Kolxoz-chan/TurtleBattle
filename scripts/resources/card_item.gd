class_name CardItem extends Resource

export (String) var title
export (String, MULTILINE) var description
export (Texture) var icon
export (Array, Resource) var _actions

func execute_actions():
	var character = CharactersManager.get_current_character()
	
	if character.is_move_possible():
		character.add_step(-1)
		
		for act in _actions:
			act.exec()
			
	if not character.is_move_possible():
		GameManager.regenerate_cards()
		GameManager.next_character()
