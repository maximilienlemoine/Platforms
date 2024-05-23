extends Area2D
@onready var timer = $Timer

func _on_body_entered(body):
	if (body.name == 'Player'):
		timer.start()
		$HurtSound.play()
		body.get_node("CollisionShape2D").queue_free()
		Engine.time_scale = 0.5

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
