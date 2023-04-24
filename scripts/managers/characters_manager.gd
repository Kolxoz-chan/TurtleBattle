extends Node

var _characters = []
var _current_caracter = 0
var _player_character : Character

var character_prefab = preload("res://prefabs/objects/Character.tscn")

func add_character(obj : Character):
	_characters.append(obj)
	
func get_characters_list() -> Array:
	return _characters
	
func get_current_character() -> Character:
	if _characters.size() > _current_caracter:
		return _characters[_current_caracter]
	else:
		return null
	
func get_player() -> Character:
	return _player_character
	
func init_characters(count, map_size):
	var game_field = get_tree().current_scene.get_node("game_field")
	var player_index = randi() % count
	var camera = CameraManager.get_camera()
	
	for i in count:
		var character = character_prefab.instance()
		character.set_dirrection(randi() % Character.Dirrection.size())
		add_character(character)
		
		if i == player_index:
			_player_character = character
			camera.set_target(character)
		
		var item = GridItem.new()
		item.add_child(character)
		
		var x = randi() % int(map_size.x)
		var y = randi() % int(map_size.y)
		game_field.set_item(Vector2(x, y), item)
		game_field.add_child(item)
