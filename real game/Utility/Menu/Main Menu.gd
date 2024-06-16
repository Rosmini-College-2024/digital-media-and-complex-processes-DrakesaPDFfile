extends Node2D

func _on_new_pressed():
	get_tree().change_scene_to_packed(load("res://Utility/Loading Screen/loading_screen.tscn"))

func _on_options_pressed():
	pass

func _on_quit_pressed():
	get_tree().quit()
