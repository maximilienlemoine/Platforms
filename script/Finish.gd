extends Area2D

func _on_body_entered(body):
	if (body.name == 'Player'):
		$AnimatedSprite2D.play("finished")
		$Timer.start()


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scene/end_scene.tscn")
