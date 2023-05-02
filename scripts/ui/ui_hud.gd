extends Control

func _ready():
	UiManager.init_ui(self.name, self)

func set_time(value):
	$vbox/hbox/timer_lab.text = str(value)
	
func set_message_visible(value):
	$vbox/hbox2/message_lab.visible = value
