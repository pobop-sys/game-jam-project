extends Node2D

@export var npc_art: int
@export_multiline var text:String

func _ready() -> void:#
	$Control.visible = true
	$Control/PanelContainer/RichTextLabel.append_text(text)
	$Control/PanelContainer/RichTextLabel.bbcode_enabled
