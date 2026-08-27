extends Node2D

var has_played_anima = false



func _on_area_2d_body_entered(body: Node2D) -> void:
	if !has_played_anima:
		$"lv ditecitons/AnimationPlayer".play("zoom_out")
		has_played_anima = true
