extends Control





func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_scense/exposition.tscn")




func _on_quit_pressed() -> void:
	get_tree().quit()





func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/test_lv.tscn")
