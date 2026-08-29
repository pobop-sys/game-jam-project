extends Node2D

var has_played_anim:bool = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if !has_played_anim:
		has_played_anim = true
		$AnimationPlayer.play("thing_animation")
		
func _ready() -> void:
	$camra/music_player.queue_free()
