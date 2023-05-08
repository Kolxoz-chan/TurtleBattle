extends Control

func _ready():
	UiManager.init_ui(self.name, self)

func set_time(value):
	$vbox/hbox/timer_lab.text = str(value)
	
func set_message(value):
	$vbox/hbox2/message_lab.text = value

func set_steps(value):
	$vbox/hbox/steps_lab.text = "Steps: " + str(value)  
	
func set_coins(value):
	$vbox/hbox/coins_lab.text = "Coins: " + str(value) 

func update_data():
	var character = CharactersManager.get_current_character()
	var inventory = InventoryManager.get_inventory(character)
	var time = GameManager.get_timer_value()
	
	set_steps(character.get_steps_count())
	set_coins(inventory.get_money())
	set_time(time)
	
	var hud = UiManager.get_ui("ui_hud")
	if CharactersManager.is_players_turn():
		hud.set_message("Player's move")
	else:
		hud.set_message("Opponent's move")
	
