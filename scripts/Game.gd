extends Node2D

onready var player = $Player
onready var ai = $AI
onready var ball = $Ball

func _physics_process(delta):
	handle_player_movement(delta)
	handle_ai_movement(delta)

func handle_player_movement(delta):
	var horizontal = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	player.move(horizontal * delta)

func handle_ai_movement(delta):
	var diff = ball.position.x - ai.position.x
	var max_abs = ai.speed * delta
	ai.move_and_collide(Vector2(clamp(diff, -max_abs, max_abs), 0))
