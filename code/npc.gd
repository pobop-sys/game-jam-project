extends Node2D


@export var npc_art: int
@export var animation_lenth: float
@export_multiline var text:String
var npc_art_file_location = [
	"tin_foil_hat",
	
]

var keep_text_box_up = false
var text_panle_visible: bool = false
var can_play_text = false

func _ready() -> void:
	$Control/PanelContainer/RichTextLabel.append_text(text)
	$Control/PanelContainer/RichTextLabel.bbcode_enabled
	$Control/PanelContainer/RichTextLabel.visible_ratio = 0
	if npc_art > len(npc_art_file_location) or npc_art < 0:
		npc_art = 0
	#var npc_load_art = load(npc_art_file_location[npc_art])
	#$Sprite2D.texture = npc_load_art
	$AnimatedSprite2D.play(npc_art_file_location[npc_art])
	
func _process(delta: float) -> void:
	if can_play_text == true:
		if !keep_text_box_up:
			$AnimationPlayer.play("text_bar_apearing")
			keep_text_box_up = true
		

func _on_player_collition_detecton_body_entered(body: Node2D) -> void:
	can_play_text = true
