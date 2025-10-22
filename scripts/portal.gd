extends Area2D

func _on_body_entered(body: CharacterBody2D) -> void:
	print("Player entered.")
	var current_level = get_tree().current_scene.scene_file_path
	var next_level_num = current_level.to_int() + 1 #finds num in file name, converts to int and adds one
	
	get_tree().change_scene_to_file("res://levels/level_" + str(next_level_num) + ".tscn")
	
	
