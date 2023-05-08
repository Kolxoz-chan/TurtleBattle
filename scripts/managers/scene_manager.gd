extends Node

var current_scene = null

func init_scene(scene):
	current_scene = scene

func get_current_scene():
	return current_scene
