extends Node2D

var scene_togo_back_to: String
# Called when the node enters the scene tree for the first time.#


const death_mesaegs: Array = [
	"not everyone can be [color=yellow] [wave]trusted [/wave][color=white]keep that in mind ",
	"not everyone can be [color=yellow] [wave]trusted [/wave][color=white]keep that in mind",
	"even thoghe people can be [color=yellow][wave]trusted [/wave][color=white] you can still fail and thats ok"
]
var lv_names: Array =[
	"res://scenes/level_scense/level_1_tutorial.tscn",
	"res://scenes/level_scense/level2.tscn",
	"res://scenes/level_scense/level3.tscn",
	"res://scenes/level_scense/level_4.tscn"
	]

var text: String
func find_the_right_death_mesage():
	if Globle.current_scene == lv_names[0]:
		text = death_mesaegs[0]
		
	elif Globle.current_scene == lv_names[1]:
		text = death_mesaegs[1]
		
	elif Globle.current_scene == lv_names[2]:
		text = death_mesaegs[2]
		$Control/RichTextLabel.size.x = 1000
		$Control/RichTextLabel.position.x = -500
		


func _ready() -> void:
	find_the_right_death_mesage()
	scene_togo_back_to = Globle.current_scene
	$Control/RichTextLabel.append_text(text)
	$Control/RichTextLabel.bbcode_enabled
	$Timer.start(7)
	$AnimationPlayer.play("tetx_apear")

# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file(scene_togo_back_to)
