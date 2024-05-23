extends Node2D

func _on_body_entered(body):
	if (body.name == 'Player'):
		if Checkpoint.last_position != global_position:
			$CheckpointSound.play()
		$AnimationPlayer.play("checkpoint")
		Checkpoint.last_position = global_position
		
