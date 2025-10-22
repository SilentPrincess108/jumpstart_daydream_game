extends Control

@onready var label: Label = $Label
@onready var buttons: VBoxContainer = $VBoxContainer
var game_running: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_running = true
	get_tree().paused = false
	label.hide()
	buttons.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("pause"):
		if game_running:
			print("pause initiated")
			pause()
		else:
			print("pause canceled")
			resume()

func resume():
	game_running = true
	label.hide()
	buttons.hide()
	get_tree().paused = false
	
func pause():
	game_running = false
	get_tree().paused = true
	label.show()
	buttons.show()

func _on_resume_pressed() -> void:
	#continue playing current level
	resume()


func _on_restart_pressed() -> void:
	#restart current level
	get_tree().reload_current_scene()


func _on_quit_pressed() -> void:
	#quit current level and return to home screen
	pass # Replace with function body.
