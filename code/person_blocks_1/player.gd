extends CharacterBody2D


const SPEED = 175.0
const PUSH_SPEED = -200
const JUMP_VELOCITY = -300.0

@export var can_move: bool = true

const sound_bank: Array = [
	"res://audio/walking sound effects/FEETHmn-CONCRETE_AUDIOELK-Fs Concrete Shoes Pant Ruffles 01_AUDIOELK_AUDIOELK.wav",
	"res://audio/walking sound effects/FEETHmn-CONCRETE_AUDIOELK-Fs Concrete Shoes Pant Ruffles 02_AUDIOELK_AUDIOELK.wav",
	"res://audio/walking sound effects/FEETHmn-CONCRETE_AUDIOELK-Fs Concrete Shoes Pant Ruffles 05_AUDIOELK_AUDIOELK.wav",
	"res://audio/walking sound effects/FEETHmn-CONCRETE_AUDIOELK-Fs Concrete Shoes Pant Ruffles 10_AUDIOELK_AUDIOELK.wav",
	"res://audio/walking sound effects/FEETHmn-CONCRETE_AUDIOELK-Fs Concrete Shoes Pant Ruffles 13_AUDIOELK_AUDIOELK.wav",
	"res://audio/walking sound effects/FEETHmn-CONCRETE_AUDIOELK-Fs Concrete Shoes Pant Ruffles 14_AUDIOELK_AUDIOELK.wav",
	"res://audio/walking sound effects/FEETHmn-CONCRETE_AUDIOELK-Fs Concrete Shoes Pant Ruffles 15_AUDIOELK_AUDIOELK.wav",
	"res://audio/walking sound effects/FEETHmn-CONCRETE_AUDIOELK-Fs Concrete Shoes Pant Ruffles 16_AUDIOELK_AUDIOELK.wav"
	]



func block_push_func():
	if Globle.push_active:
		if Globle.push_varent == "up":
			velocity.y = PUSH_SPEED * 3
		else:
			velocity.x = (PUSH_SPEED * Globle.push_dir)
	
	else: pass

func animation_handler():
	if is_on_floor() and !velocity.x == 0:
		$AnimatedSprite2D.play("walk")
	elif is_on_floor() and velocity.x == 0:
		$AnimatedSprite2D.play("idle")
	if !is_on_floor() and velocity.y < 0:
		$AnimatedSprite2D.play("jump")
	if !is_on_floor() and velocity.y > 0:
		$AnimatedSprite2D.play("falling")
		
		
func _physics_process(delta: float) -> void:
	
	if !can_move:
		$AnimatedSprite2D.play("idle")
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$"jump sound effect".play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	
	if direction == 1:
		$AnimatedSprite2D.flip_h = false
	elif direction == -1:
		$AnimatedSprite2D.flip_h = true
	
	if !velocity.x == 0 and is_on_floor():
		if !$AudioStreamPlayer2D.is_playing():
			$AudioStreamPlayer2D.play()
			
		else: pass
	
	if $AudioStreamPlayer2D.get_playback_position() > 0.6:
		$AudioStreamPlayer2D.stop()
	
	Globle.player_pos_y = position.y
	Globle.player_pos_x = position.x
	
	block_push_func()
	animation_handler()
	
	move_and_slide()
