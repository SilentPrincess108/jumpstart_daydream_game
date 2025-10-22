extends Node2D

var game_running: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_running = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("pause"):
		if game_running:
			print("pause initiated")
			game_running = false
			get_tree().paused = true
		else:
			print("pause canceled")
			game_running = true
			get_tree().paused = false
