extends Node2D


@export var is_telling_truth: bool
# push dir off = left push on = right push
@export var effect_push :bool
@export var push_direction:bool

#art file loactions array
const block_art_file_loactions: Array = [
	"res://art/block_art/icon.svg"
	
]
@export var wich_block_art_file:int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var block_art = load(block_art_file_loactions[wich_block_art_file])
	$Sprite2D.texture = block_art


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$StaticBody2D/CollisionShape2D.disabled = is_telling_truth
