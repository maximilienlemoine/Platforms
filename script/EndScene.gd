extends CanvasLayer

var levelPath = "res://scene/level/level_%s.tscn"

func _on_quit_button_pressed():
	$ButtonPressedSound.play()
	get_tree().quit()

func _on_replay_button_pressed():
	$ButtonPressedSound.play()
	var actualLevelPath = levelPath % LevelManager.level
	TimeManager.time = 0
	Checkpoint.last_position = null
	get_tree().change_scene_to_file(actualLevelPath)

func _on_next_level_button_pressed():
	$ButtonPressedSound.play()
	LevelManager.level += 1
	Checkpoint.last_position = null
	var actualLevelPath = levelPath % LevelManager.level
	TimeManager.time = 0
	get_tree().change_scene_to_file(actualLevelPath)
