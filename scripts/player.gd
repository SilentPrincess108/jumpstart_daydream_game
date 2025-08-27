extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@export_range(0, 1) var deceleration = 0.1
@export_range(0, 1) var acceleration = 0.1
@export_range(0, 1) var decelerate_on_jump_release = 0.5

const JUMP = -400.0
const SPEED = 300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var width = 1200/2
var height = 700/2

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta #Brings player down when if not on collidable object
	get_input()
	

func get_input():
	#var for player direction
	var direction = Input.get_axis("left", "right")
	
	#Handle animations
	if is_on_floor() and direction:
		animated_sprite.play("Run")
		if direction >= 1:
			animated_sprite.flip_h = false
		else:
			animated_sprite.flip_h = true
	elif not is_on_floor():
		animated_sprite.play("Jump")
	else:
		animated_sprite.play("Idle")
	
	#Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP
	
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y *= decelerate_on_jump_release
	
	#Handle movement w/ accel/decel
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, SPEED * acceleration) #acceleration
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * deceleration) #deceleration
	move_and_slide()
