extends Panel

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0

func _on_timer_tree_entered():
	time = TimeManager.time

func _process(delta) -> void:
	time += delta
	TimeManager.time = time
	msec = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600)/60
	$Minutes.text = "%02d:" % minutes
	$Seconds.text = "%02d." % seconds
	$MicroSeconds.text = "%03d" % msec
	
func stop() -> void:
	set_process(false)
	
func resetTimer() -> void:
	time = 0

