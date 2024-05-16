extends CharacterBody2D

const SPEED = 150
const JUMP_VELOCITY = -300.0
const WALL_JUMP_VELOCITY = 1000
const WALL_SLIDE_GRAVITY = 1500

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var double_jump = true
var dash = false
var is_on_cooldown_dash = true

@onready var animatedSprite = $AnimatedSprite2D
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var timer = $Timer

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	jump(delta)
	handle_animation(direction)
	
	if Input.is_action_just_pressed("ui_accept") and is_on_cooldown_dash:
		dash = true
		is_on_cooldown_dash = false
		velocity.x += direction * SPEED * 2
		await get_tree().create_timer(0.2).timeout
		dash = false
		$Timer.start()
		
	if direction:
		if not dash:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 15)

	move_and_slide()
	
func jump(delta):
	if not is_on_floor():
		if is_on_wall() and Input.is_action_pressed("ui_up"):
			double_jump = true
			velocity.y = WALL_SLIDE_GRAVITY * delta
			if Input.is_action_just_pressed("ui_right"):
				velocity.y = JUMP_VELOCITY*1.2
			if Input.is_action_just_pressed("ui_left"):
				velocity.y = JUMP_VELOCITY*1.2
		else:
			velocity.y += gravity * delta
			
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			double_jump = true
			velocity.y = JUMP_VELOCITY
		elif double_jump:
			double_jump = false
			velocity.y = JUMP_VELOCITY

func handle_animation(direction):
	if direction > 0:
		animatedSprite.flip_h = false
	elif direction < 0:
		animatedSprite.flip_h = true
		
	if dash:
		animatedSprite.play("roulade")
	else:
		if is_on_floor(): 
			if direction == 0:
				animatedSprite.play("idle")
			else:
				animatedSprite.play("run")
		else:
			if is_on_wall_only():
				animatedSprite.play("wall_jump")
			else:
				animatedSprite.play("jump")


func _on_timer_timeout():
	is_on_cooldown_dash = true
