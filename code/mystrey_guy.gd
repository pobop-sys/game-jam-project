extends Node2D


@export var flip: bool
@export var text_box_play_on_load: bool
@export var textbox_visible: bool
@export var text_box_hight: int
@export var npc_art: int
@export var text_visiblity_ratio:float
@export_multiline var text:String
@export_multiline var notes: String



func _ready() -> void:
	if !text_box_play_on_load:
		textbox_visible = false
	
	$Control.position.y = text_box_hight
	
	$Control.visible = textbox_visible
	
	if flip:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
		
	$Control.visible = true
	$Control/PanelContainer/RichTextLabel.append_text(text)
	$Control/PanelContainer/RichTextLabel.bbcode_enabled
	
	if text_box_play_on_load:
		$AnimationPlayer.play("play_text")

func _process(delta: float) -> void:
	if !text_box_play_on_load:
		pass
	
	if textbox_visible:
		print("thing thing")
		$Control.visible = textbox_visible
		$AnimationPlayer.play("play_text")
	
	
