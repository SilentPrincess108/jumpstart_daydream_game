extends AnimatableBody2D

@export var game_name: String = "Temp Name"
@export var desc: String = "Temp desc"
@onready var label: Label = $Label
@onready var player: CharacterBody2D = $"../player"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = game_name
	label.hide()

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	print("entered")
	label.show()


func _on_area_2d_body_exited(body: CharacterBody2D) -> void:
	print("exited")
	label.hide()
