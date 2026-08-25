extends Node2D

@export var is_telling_truth: bool
#art file loactions array
const block_art_file_loactions: Array = [
	"res://art/block_art/icon.svg"
]
@export var wich_block_art_file:int

func _ready() -> void:
	if !is_telling_truth:
		$StaticBody2D/CollisionShape2D.set_deferred("disabled",true)
	var block_art = load(block_art_file_loactions[wich_block_art_file])
	$Sprite2D.texture = block_art
	print(is_telling_truth)
	

func _physics_process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if !is_telling_truth:
		$AnimationPlayer.play("fade")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if !is_telling_truth:
		$AnimationPlayer.play_backwards("fade")
