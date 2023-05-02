extends Node

export (Dictionary) var ui_list

func init_ui(name : String, ui : Control):
	ui_list[name] = ui

func get_ui(name : String):
	return ui_list[name]
