extends Node2D

@export var anima_walking: bool
@export var anima_idle: bool


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if anima_idle and anima_walking:
		anima_walking = false
	
	if anima_idle:
		$AnimatedSprite2D.play("idle")
	
	elif anima_walking:
		$AnimatedSprite2D.play("walking")
