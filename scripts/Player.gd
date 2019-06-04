extends KinematicBody2D

const SPEED = 100
const GRAVITY = 10
const JUMP_FORCE = -200

const PROJECTILE_SCENE = preload("res://prefabs/projectile.tscn")

var motion = Vector2();

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$FireOrigin.position.x = 28
		$Sprite.set_flip_h(false)
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$FireOrigin.position.x = -28
		$Sprite.set_flip_h(true)
	else:
		motion.x = 0
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_jump"):
			motion.y = JUMP_FORCE
	
	motion = move_and_slide(motion, Vector2.UP)

func _screen_exited():
	#Replace with death function
	print("you died");

func _process(delta):
	if Input.is_action_just_pressed("ui_fire"):
		var projectile = PROJECTILE_SCENE.instance()
		projectile.init(Vector2.LEFT if $Sprite.flip_h else Vector2.RIGHT)
		get_parent().add_child(projectile)
		projectile.set_position($FireOrigin.get_global_transform().get_origin())
