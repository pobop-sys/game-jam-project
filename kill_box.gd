extends Area2D


var current_scene_name

func _ready() -> void:
	current_scene_name = get_tree().current_scene.scene_file_path
	Globle.current_scene = current_scene_name
	



func _on_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://scenes/death_screan.tscn")
