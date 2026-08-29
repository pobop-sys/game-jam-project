extends Node2D

@export var inky_falling: bool
@export var play_boss_man_reveal: bool


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$npc_conraner/cray.play("cray")
	$npc_conraner/bingus.play("bingus")
	$"npc_conraner/angry guy".play("angry guy")
	$npc_conraner/blue_shirt_guy.play("blue_shirt_guy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !inky_falling:
		pass
	
	elif inky_falling:
		pass
		#inky falling anim play hither
	
	if play_boss_man_reveal:
		
		$AnimatedSprite2D.play("big revelal")
	
	if !$AnimationPlayer.is_playing():
		get_tree().change_scene_to_file("res://scenes/credits.tscn")
