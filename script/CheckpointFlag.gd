extends Node2D

func _on_body_entered(body):
	if (body.name == 'Player'):
		$AnimationPlayer.play("checkpoint")
		Checkpoint.last_position = global_position
		
