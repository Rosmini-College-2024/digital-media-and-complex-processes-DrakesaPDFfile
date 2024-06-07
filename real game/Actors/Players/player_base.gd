extends "res://Actors/Character/character.gd"

signal health_depleted

var health = 100.0

func _input(event):
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		move_to_position(get_global_mouse_position())

		
func _physics_process(delta):
	move(delta)
	
	const DAMAGE_RATE = 30.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()

