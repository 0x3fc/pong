extends Control

onready var ai_score_label = $AIScore
onready var player_score_label = $PlayerScore
onready var game_status = $GameStatus

var ai_score = 0
var player_score = 0

func gain_player_score():
	player_score += 1
	player_score_label.set_text(String(player_score))

func gain_ai_score():
	ai_score += 1
	ai_score_label.set_text(String(ai_score))

func new_game():
	ai_score = 0
	player_score = 0
	game_status.hide()

func end(is_player_winning):
	game_status.set_text("You won!" if is_player_winning else "You lost :(")
	game_status.show()
