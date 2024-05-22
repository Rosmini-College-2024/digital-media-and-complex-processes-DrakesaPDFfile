extends "res://Actors/Character/character.gd"

func _input(event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		move_to_position(get_global_mouse_position())
		
		
func _physics_process(delta):
	move(delta)
