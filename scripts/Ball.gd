extends KinematicBody2D

onready var game = get_tree().get_root().get_node("Game")

const INITIAL_SPEED = 180
const SPEED_MULTIPLIER = 1.1
const PADDLE_POSITION_ADJUSTMENT = Vector2(0, -40)

var velocity = Vector2.ZERO

func _ready():
	start()

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		if collision.collider.get_class() == "StaticBody2D":
			velocity = velocity.bounce(collision.normal)
		else:
			var n = (collision.collider.position - PADDLE_POSITION_ADJUSTMENT - position).normalized()
			velocity = velocity.bounce(n) * SPEED_MULTIPLIER

func start():
	position = Vector2(150, 256)
	randomize()
	velocity = Vector2.UP.rotated(deg2rad(randi() % 360)) * INITIAL_SPEED


func _on_VisibilityNotifier2D_screen_exited():
	game.new_round()
