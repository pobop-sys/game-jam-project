extends Node2D

@export var flip_spright: bool
@export var npc_art: int
@export var textbox_size_x: int
@export var textbox_size_y: int
@export var text_box_hight_above_npc: float
@export var text_box_position_y: float
@export var animation_lenth: float
@export_multiline var text: String
@export_multiline var notes: String


var npc_art_file_location = [
	"tin_foil_hat",
	"blue_shirt_guy",
	"angry_guy",
	"inky",
	"bingus"
]

var keep_text_box_up = false
var text_panle_visible: bool = false
var can_play_text = false

func _ready() -> void:
	if npc_art_file_location[4]:
		$Sprite2D.position.y += 30
	
	$Control/PanelContainer.size.x = textbox_size_x
	$Control/PanelContainer.size.y = textbox_size_y
	
	$Control.position.y += text_box_hight_above_npc
	
	
	$Control/PanelContainer/RichTextLabel.append_text(text)
	$Control/PanelContainer/RichTextLabel.bbcode_enabled
	$Control/PanelContainer/RichTextLabel.visible_ratio = 0
	
	if npc_art > len(npc_art_file_location) or npc_art < 0:
		npc_art = 0
		
	$AnimatedSprite2D.play(npc_art_file_location[npc_art])
	$AnimatedSprite2D.flip_h = flip_spright
	
	
func _process(delta: float) -> void:
	if can_play_text == true:
		if !keep_text_box_up:
			print("thingy thingy")
			$AnimationPlayer.play("text_bar_apearing")
			keep_text_box_up = true
		

func _on_player_collition_detecton_body_entered(body: Node2D) -> void:
	can_play_text = true
