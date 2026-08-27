extends Node2D

@export var flip: bool
@export var text_box_play_on_load: bool

@export var text_box_hight: int 
@export var npc_art: int
@export var text_visiblity_ratio: float
@export_multiline var text: String
@export_multiline var notes: String

func load_textbox_and_play_anim():
	$AnimationPlayer.play("textbar_apear")
	$AnimationPlayer.queue("play_text")

func _ready() -> void:
	$Control/PanelContainer/RichTextLabel.bbcode_enabled = true
	$Control/PanelContainer/RichTextLabel.append_text(text)
	
	$Control.position.y = text_box_hight
	$AnimatedSprite2D.flip_h = flip
	
	$Control.visible = true
	
	if text_box_play_on_load:
		$AnimationPlayer.play("textbar_apear")
		$AnimationPlayer.queue("play_text")
	else:
		$AnimationPlayer.play_backwards("textbar_apear")
		
func _process(delta: float) -> void:
	if Globle.play_mg_textbox:
		load_textbox_and_play_anim()
		Globle.play_mg_textbox = false
