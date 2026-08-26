extends Node2D

var has_played_animation: bool = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("tingy thing")
	if has_played_animation:
		$level_detections/Area2D/AnimationPlayer.play("make mystry guy play animation")
		has_played_animation = true
	
	else: pass
