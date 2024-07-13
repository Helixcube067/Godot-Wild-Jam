extends Control



func _on_play_button_down():
	get_tree().change_scene_to_file("res://assets/game.tscn")


func _on_setting_pressed():
	get_tree().change_scene_to_file("res://assets/Setting.tscn")


func _on_quit_pressed():
	get_tree().quit()
