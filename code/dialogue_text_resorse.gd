extends Resource
class_name dialoguetext

@export var speaker_image: Texture
@export var speaker_img_hframes: int = 1
@export var speaker_img_rest_frame: int = 0

#@export_multiline(var text: string) 
@export_range(0.1, 30.0, 0.1) var text_speed: float

@export var text_sound: AudioStream
@export
