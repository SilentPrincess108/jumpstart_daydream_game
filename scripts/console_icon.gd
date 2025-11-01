extends Area2D

func _on_mouse_entered() -> void:
	print("mouse entered")

func _on_mouse_exited() -> void:
	print("mouse exited")
	
func clicked(event:InputEvent): #does not work
	if event is InputEventMouseButton:
		if event.pressed:
			print("clicked")
