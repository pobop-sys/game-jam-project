extends Node2D

@export var cam_controls = ""

var pos_to_go_to_y = Globle.player_pos_y
var pos_to_go_to_x = Globle.player_pos_x


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pos_to_go_to_x = Globle.player_pos_x
	pos_to_go_to_y = Globle.player_pos_y
	
	
	position.x = pos_to_go_to_x
	position.y = pos_to_go_to_y
