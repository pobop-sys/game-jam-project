extends Node2D

var decorations_files: Array = [
	"res://art/Bin .png",
	"res://art/Chair.png",
	"res://art/Fileing cabinet.png",
	"res://art/Table.png"
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var decoration_ran = randi_range(0,3)
	var decoration_load = load(decorations_files[decoration_ran])
	$Sprite2D.texture = decoration_load
	
	if decorations_files[decoration_ran] == "res://art/Fileing cabinet.png":
		$Sprite2D.position.y += 2
	
	elif decorations_files[decoration_ran] == "res://art/Table.png":
		$Sprite2D.position.y -= 7
