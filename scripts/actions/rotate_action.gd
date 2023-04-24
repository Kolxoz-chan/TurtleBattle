class_name RotateAction extends Action

export (int) var quarter_value

func exec():
	var character = CharactersManager.get_current_character()
	if character == null:
		return 
	
	character.rotate_quarter(quarter_value)
	
