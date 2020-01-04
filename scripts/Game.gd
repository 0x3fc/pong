extends Node2D

onready var player = $Player

func _physics_process(delta):
	handle_player_movement(delta)

func handle_player_movement(delta):
	var horizontal = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	player.move(horizontal * delta)
