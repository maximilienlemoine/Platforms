extends Node2D

@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	if (body.name == 'Player'):
		animation_player.play("checkpoint")
		Checkpoint.last_position = global_position
		
