extends Node

var _state : State

func _ready():
	set_state(PlayState.new())

func _input(event):
	_state.on_input(event)

func _process(delta):
	_state.on_update(delta)

func set_state(state : State):
	_state = state
