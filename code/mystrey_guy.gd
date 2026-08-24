extends Node2D


@export var flip: bool
@export var npc_art: int
@export_multiline var text:String
@export var text_visiblity_ratio:float

func _ready() -> void:
	if flip:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
		
	$Control.visible = true
	$Control/PanelContainer/RichTextLabel.append_text(text)
	$Control/PanelContainer/RichTextLabel.bbcode_enabled

func _process(delta: float) -> void:
	$Control/PanelContainer/RichTextLabel.visible_ratio = text_visiblity_ratio
