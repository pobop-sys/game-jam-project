extends Node2D


@export var is_inky: bool
@export var anima_walking: bool
@export var anima_idle: bool
@export var inky_falling: bool


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !is_inky:
		if anima_idle and anima_walking:
			anima_walking = false
		
		if anima_idle:
			$AnimatedSprite2D.play("idle")
		
		elif anima_walking:
			$AnimatedSprite2D.play("walking")
			
	if is_inky:
		if anima_walking:
			pass
		if anima_idle:
			$AnimatedSprite2D.play("inkyi_dle")
		if inky_falling:
			$AnimatedSprite2D.play("inky dead")
		
