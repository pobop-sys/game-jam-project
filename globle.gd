extends Node

#defalt setings
var music_vol: float = 100.0
var var_sound_effects: float = 100.0

#
var player_pos_y = 0
var player_pos_x = 0

var push_active:bool = false
var push_dir:int = 0

var play_mg_textbox: bool = false

var current_scene: String

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if play_mg_textbox:
		print(play_mg_textbox)
