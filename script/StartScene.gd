extends CanvasLayer

func _on_level_1_button_pressed():
	LevelManager.level = 1;
	TimeManager.time = 0
	get_tree().change_scene_to_file("res://scene/level/level_1.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
