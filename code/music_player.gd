extends Node2D


func _process(delta: float) -> void:
	position.x = Globle.player_pos_x
	position.y = Globle.player_pos_y
