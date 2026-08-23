extends Node2D

@export var cam_controls = ""


# options = "left_right", "up_down", "both" 

var pos_to_go_to_y = Globle.player_pos_y
var pos_to_go_to_x = Globle.player_pos_x


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pos_to_go_to_x = Globle.player_pos_x
	pos_to_go_to_y = Globle.player_pos_y
	
	if cam_controls == "left_right":
		position.x = pos_to_go_to_x
		
	elif cam_controls == "up_down":
		position.y = pos_to_go_to_y
		
	elif cam_controls == "both":
		position.y = pos_to_go_to_y
		position.x = pos_to_go_to_x
