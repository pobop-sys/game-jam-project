extends Node2D
class_name player

const dialoguebuttonprelead = preload("res://scenes/dialogue_button.tscn")

@onready var dialoguelabe: RichTextLabel = $HBoxContainer/VBoxContainer/RichTextLabel
@onready var speakerspright: Sprite2D = $"HBoxContainer/speaker parent/Sprite2D"

var dialogue:Array[de]
var current_dialogue_item
var next_item: bool = true

var player_node: CharacterBody2D

func _ready() -> void:
	visible = false
	$HBoxContainer/VBoxContainer/button_conter.visible = false
	
	
	for i in get_tree().get_nodes_in_group("player"):
		player_node = i
	

func _process(_delta: float) -> void:
	if current_dialogue_item == dialogue.size():
		if!player_node:
			for i in get_tree().get_nodes_in_group("player"):
				player_node = i
			return
		player_node.can_move = true
		queue_free()
		return
	
	if next_item:
		next_item = false
		var i = dialogue[current_dialogue_item]
		
		if i is dialoguefucntion:
			if i.hide_dialouge_box:
				visible = false
			else:
				visible = true
			_function_resorse(i)
		
		elif i is dialoguechoice:
			visible = true
			_choice_resorse(i)
		
		elif i is dialoguetext:
			visible = true
			_text_resorce(i)
		
		else:
			printerr("you accidentily added a de resorce")
			current_dialogue_item += 1 
			next_item = true
		

func _function_resorse(i: dialoguefucntion) -> void:
	var target_node = get_node(i.target_path)
	if target_node.has_method(i.function_name):
		if i.function_arguments.size() == 0:
			target_node.call(i.function_name)
		else:
			target_node.callv(i.function_name, i.function_arguments)
			
	if i.wait_for_signle_to_continue:
		var signle_name = i.wait_for_signle_to_continue
		if target_node.has_signal(signle_name):
			var signal_state = {"done": false}
			var callable = func(_args): signal_state.done = true
			target_node.connect(signle_name, callable, CONNECT_ONE_SHOT)
			while not signal_state.done:
				await  get_tree().process_frame
	current_dialogue_item += 1
	next_item = true

func _choice_resorse(i: dialoguechoice) -> void:
	dialoguelabe.text = i.text
	dialoguelabe.visible_characters = -1
	if i.speaker_img:
		$"HBoxContainer/speaker parent".visible = true
		speakerspright.texture = i.speaker_img
		speakerspright.hframes = i.speaker_img_hframs
		speakerspright.frame = min(i.speaker_img_select_frames)
	else:
		$"HBoxContainer/speaker parent".visible = false
	$HBoxContainer/VBoxContainer/button_conter.visible = true
	
	for item in i.choice_text.size():
		var dialoguebuttonvar = dialoguebuttonprelead.instantiate()
		dialoguebuttonvar.text = i.choice_text[item]
		
		var function_resorce: dialoguefucntion = i.choise_function_call[item]
		if function_resorce:
			dialoguebuttonvar.connect("pressed",
			Callable(get_node(function_resorce.target_path),function_resorce.function_name).bindv(function_resorce.function_arguments),
			CONNECT_ONE_SHOT)
			if function_resorce.hide_dialouge_box:
				dialoguebuttonvar.connect("pressed", hide, CONNECT_ONE_SHOT)
	
		
		
	

func _text_resorce(i: dialoguetext) -> void:
	pass
