extends Label

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0
var timeString = ''

func _on_end_scene_tree_entered():
	time = TimeManager.time
	msec = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600)/60
	timeString = 'Temps réalisé = ' + str(minutes) + 'min ' + str(seconds) + 's ' + str(msec) +'µs '
	$".".text = timeString
