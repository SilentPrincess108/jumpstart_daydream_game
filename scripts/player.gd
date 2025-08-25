extends CharacterBody2D

@onready var player: CharacterBody2D = $"."

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
		print("left")
	elif event.is_action_pressed("right"):
		position.x += SPEED * delta
		print("right")
	move_and_slide()
