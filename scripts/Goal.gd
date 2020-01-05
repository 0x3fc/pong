extends Area2D

export var is_player = true
onready var score = get_tree().get_root().get_node("Game/Score")

func _on_Goal_body_entered(body):
	if body.get_class() != "KinematicBody2D":
		return
	
	if is_player:
		score.gain_player_score()
	else:
		score.gain_ai_score()
