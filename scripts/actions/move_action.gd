class_name MoveAction extends Action

export var steps_count = 1

func exec():
	var character = CharactersManager.get_current_character()
	if character == null:
		return 
	
	var dirr = character.get_dirrection()
	var parent = character.get_parent()
	if parent and parent is GridItem:
		if dirr == Character.Dirrection.BOTTOM:
			parent.move(Vector2.DOWN * steps_count)
		if dirr == Character.Dirrection.TOP:
			parent.move(Vector2.UP * steps_count)
		if dirr == Character.Dirrection.LEFT:
			parent.move(Vector2.LEFT * steps_count)
		if dirr == Character.Dirrection.RIGHT:
			parent.move(Vector2.RIGHT * steps_count)
		
