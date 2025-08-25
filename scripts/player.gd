extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const JUMP = -200.0
const SPEED = 300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var width = 1200/2
var height = 700/2


func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		position.y += gravity * delta
	get_input(Input, delta)
		
func get_input(event, delta):
	if event.is_action_pressed("left"):
		position.x -= SPEED * delta
		animated_sprite.flip_h = true
		animated_sprite.play("Run")
	elif event.is_action_pressed("right"):
		position.x += SPEED * delta
		animated_sprite.flip_h = false
		animated_sprite.play("Run")
	elif event.is_action_pressed("jump"):
		position.y = JUMP
	else:
		animated_sprite.play("Idle")
	move_and_slide()
