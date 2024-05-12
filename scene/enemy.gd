extends Node2D

const SPEED = 45

var direction = 1
var has_changed_direction = false
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var animated_sprite = $AnimatedSprite2D
@onready var ray_cast_bottom = $RayCastBottom
@onready var timer = $Timer

func _process(delta):
	if not ray_cast_bottom.is_colliding() and !has_changed_direction:
		has_changed_direction = true
		timer.start()
		animated_sprite.flip_h = !animated_sprite.flip_h
		direction = -1 if (direction == 1) else 1
		position.x += direction * SPEED * delta
	
	if ray_cast_right.is_colliding():
		if not ray_cast_right.get_collider().name == 'Player':
			animated_sprite.flip_h = true
			direction = -1
	if ray_cast_left.is_colliding():
		if not ray_cast_left.get_collider().name == 'Player':
			animated_sprite.flip_h = false
			direction = 1
	
	position.x += direction * SPEED * delta


func _on_timer_timeout():
	has_changed_direction = false
	pass # Replace with function body.
