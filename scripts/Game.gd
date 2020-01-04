extends Node2D

onready var player = $Player

func _physics_process(_delta):
	handle_player_movement()

func handle_player_movement():
	var horizontal = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	player.move(horizontal)
