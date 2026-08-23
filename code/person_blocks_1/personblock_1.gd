extends Node2D

@export var is_telling_truth = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_telling_truth:
		$StaticBody2D/CollisionShape2D.disabled = false
	
	if ! is_telling_truth:
		$StaticBody2D/CollisionShape2D.disabled = true
