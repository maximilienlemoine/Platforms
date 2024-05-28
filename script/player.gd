extends CharacterBody2D

@export var SPEED = 150
@export var JUMP_VELOCITY = -300.0
@export var WALL_JUMP_VELOCITY = 1000
@export var WALL_SLIDE_GRAVITY = 1500

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var double_jump = true
var dash = false
var is_on_cooldown_dash = true

@onready var animatedSprite = $AnimatedSprite2D
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var timer = $Timer

enum States {
	IDLE,
	RUN,JUMP,
	AIR,
	DEAD,
}

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("controller_left", "controller_right")
	jump(delta)
	handle_animation(direction)
	
	if Input.is_action_just_pressed("dash") and is_on_cooldown_dash:
		dash = true
		is_on_cooldown_dash = false
		$RollSound.play()
		if (direction == 0):
			if animatedSprite.flip_h == true:
				velocity.x += -1 * SPEED * 2
			else:
				velocity.x += 1 * SPEED * 2
		else:
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
		if is_on_wall() and Input.is_action_pressed("jump"):
			double_jump = true
			velocity.y = WALL_SLIDE_GRAVITY * delta
			if Input.is_action_just_pressed("controller_right"):
				$JumpSound.play()
				velocity.y = JUMP_VELOCITY*1.2
			if Input.is_action_just_pressed("controller_left"):
				$JumpSound.play()
				velocity.y = JUMP_VELOCITY*1.2
		else:
			velocity.y += gravity * delta
			
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			double_jump = true
			$JumpSound.play()
			velocity.y = JUMP_VELOCITY
		elif double_jump:
			double_jump = false
			$JumpSound.play()
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
