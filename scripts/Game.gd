extends Node2D

const WINNING_SCORE = 7

onready var player = $Player
onready var ai = $AI
onready var ball = $Ball
onready var score = $Score

var in_game = true

func _physics_process(delta):
	if not in_game:
		return
	
	handle_player_movement(delta)
	handle_ai_movement(delta)

func handle_player_movement(delta):
	var horizontal = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	player.move(horizontal * delta)

func handle_ai_movement(delta):
	var diff = ball.position.x - ai.position.x
	var max_abs = ai.speed * delta
	ai.move_and_collide(Vector2(clamp(diff, -max_abs, max_abs), 0))

func handle_restart_game():
	if Input.is_action_just_pressed("ui_accept"):
		score.new_game()
		in_game = true
		place_ball()

func place_ball():
	if is_game_ended():
		return

	ball.start()

func new_round():
	place_ball()

func is_game_ended():
	if score.player_score >= WINNING_SCORE:
		score.end(true)
	elif score.ai_score >= WINNING_SCORE:
		score.end(false)
	else:
		return false

	ball.end()
	in_game = false
	return true
