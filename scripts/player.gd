extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const JUMP = 300.0
const SPEED = 500.0

var width = 1200/2
var height = 700/2

func _ready() -> void:
	position = Vector2(width, height)

func _physics_process(delta: float) -> void:
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
	else:
		animated_sprite.play("Idle")
	move_and_slide()
