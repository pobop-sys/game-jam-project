extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$npc_conraner/inky.play("inky")
	$npc_conraner/cray.play("cray")
	$npc_conraner/bingus.play("bingus")
	$npc_conraner/blue_shirt_guy.play("blue_shirt_guy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
