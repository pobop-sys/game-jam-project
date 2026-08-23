extends de
class_name dialoguechoice

@export var speaker_img: Texture
@export var speaker_img_hframs: int = 1
@export var speaker_img_select_frames: int = 1

@export_multiline var text: String

@export var choice_text: Array[String]
@export var choise_function_call: Array[dialoguefucntion] 
