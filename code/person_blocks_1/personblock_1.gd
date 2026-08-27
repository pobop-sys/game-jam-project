extends Node2D

@export var is_telling_truth: bool
@export var push_varent: String
var push_dir = 0
#art file loactions array
const block_art_file_loactions: Array = [
	"res://art/block_art/anger guy (platform).png",
	"res://art/block_art/Blue shirt guy (platform).png",
	"res://art/block_art/Inky (platform).png",
	"res://art/block_art/Bingus (platform).png",
	"res://art/block_art/Tinfoil hat (platform) .png"
]
@export var wich_block_art_file:int
@export_multiline var notes:String
@export_multiline var array_noets: String
func _ready() -> void:
	if !is_telling_truth:
		$StaticBody2D/CollisionShape2D.set_deferred("disabled",true)
	
	if push_varent == "none":
		pass
		
	elif push_varent == "right":
		push_dir = -1
		
	elif push_varent == "left":
		push_dir = 1
	
	
	var block_art = load(block_art_file_loactions[wich_block_art_file])
	$Sprite2D.texture = block_art
	print(is_telling_truth)
	if block_art_file_loactions[wich_block_art_file] == "res://art/block_art/Tinfoil hat (platform) .png":
		$Sprite2D.global_position.y += 29
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if !is_telling_truth:
		$AnimationPlayer.play("fade")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if !is_telling_truth:
		$AnimationPlayer.play_backwards("fade")


func _on_push_detection_body_entered(body: Node2D) -> void:
	print("player enterd")
	if push_varent == "none":
		pass
	
	elif push_varent == "left" or "right":
		Globle.push_active = true
		Globle.push_dir = push_dir
		Globle.push_varent = push_varent
	 


func _on_push_detection_body_exited(body: Node2D) -> void:
	Globle.push_active = false
