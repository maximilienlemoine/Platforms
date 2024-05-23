extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	if (body.name == 'Player'):
		$EndSound.play()
		$AnimatedSprite2D.play("finished")
		$Timer.start()


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scene/ui/end_scene.tscn")
