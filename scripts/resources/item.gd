class_name CardItem extends Resource

export (String) var title
export (String, MULTILINE) var description
export (Texture) var icon
export (Array, Resource) var _actions

func execute_actions():
	for act in _actions:
		act.exec()
