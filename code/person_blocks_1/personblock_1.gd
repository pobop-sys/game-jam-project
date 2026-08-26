extends Node2D

@export var is_telling_truth: bool
@export var push_varent: String
var push_dir = 0
#art file loactions array
const block_art_file_loactions: Array = [
	"res://art/block_art/icon.svg"
]
@export var wich_block_art_file:int

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
	 


func _on_push_detection_body_exited(body: Node2D) -> void:
	Globle.push_active = false
