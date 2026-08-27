extends Node2D

var has_played_animation: bool = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if !has_played_animation:
		Globle.play_mg_textbox = true
		has_played_animation = true
	else:
		pass
