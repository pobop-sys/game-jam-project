extends Node2D

@export var is_telling_truth: bool
#art file loactions array
const block_art_file_loactions: Array = [
	"res://art/block_art/icon.svg"
]
@export var wich_block_art_file:int

func _ready() -> void:
	var block_art = load(block_art_file_loactions[wich_block_art_file])
	$Sprite2D.texture = block_art
	print(is_telling_truth)
	

func _physics_process(delta: float) -> void:
	$StaticBody2D/CollisionShape2D.disabled = is_telling_truth
