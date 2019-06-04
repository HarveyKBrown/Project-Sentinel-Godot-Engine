extends KinematicBody2D

const SPEED = 200

var movement

func init(direction):
	movement = direction * SPEED

func _screen_exited():
	self.queue_free()
	
func _physics_process(delta):
	# Correct for the direction faced
	# Max projectiles
	# Make collision behaviour
	# Set offset/spawn location
	move_and_slide(movement, Vector2.UP)