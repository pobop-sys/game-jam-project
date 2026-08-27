extends Node2D

var scene_togo_back_to: String
# Called when the node enters the scene tree for the first time.#

@export_multiline var death_text: String

func _ready() -> void:
	scene_togo_back_to = Globle.current_scene
	$Timer.start(10)

# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file(scene_togo_back_to)
