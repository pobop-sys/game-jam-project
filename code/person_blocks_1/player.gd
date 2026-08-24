extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -200.0

var can_move: bool = true

func _physics_process(delta: float) -> void:
	
	if !can_move:
		#idle andimation
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("walk_belly_bounce")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("idle")
		
	Globle.player_pos_y = position.y
	Globle.player_pos_x = position.x
	
	move_and_slide()
