extends Node

var _inventories = Dictionary()

func init_inventory(owner : Character):
	_inventories[owner] = Inventory.new()
	return _inventories[owner]

func get_inventory(owner : Character) -> Inventory:
	return _inventories[owner]
 
