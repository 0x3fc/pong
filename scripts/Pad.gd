extends Node2D

var speed = 3

func move(horizontal):
	position.x += horizontal * speed
