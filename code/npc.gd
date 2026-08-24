extends Node2D


@export var npc_art: int
var npc_art_file_location = [
	"res://art/npc art/test_image1.png",
	"res://art/npc art/test_image2.png",
	"res://art/npc art/test_image3.png"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if npc_art > len(npc_art_file_location) or npc_art < 0:
		npc_art = 0
	var npc_load_art = load(npc_art_file_location[npc_art])
	$Sprite2D.texture = npc_load_art


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
