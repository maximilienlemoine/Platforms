extends CanvasLayer

var levelPath = "res://scene/level/level_%s.tscn"

func _on_quit_button_pressed():
	get_tree().quit()

func _on_replay_button_pressed():
	var actualLevelPath = levelPath % LevelManager.level
	TimeManager.time = 0
	get_tree().change_scene_to_file(actualLevelPath)

func _on_next_level_button_pressed():
	LevelManager.level += 1
	var actualLevelPath = levelPath % LevelManager.level
	TimeManager.time = 0
	get_tree().change_scene_to_file(actualLevelPath)
