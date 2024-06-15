extends "res://Actors/Character/character.gd"

signal health_depleted

var health = 100.0

@onready var camera_2d = $Camera2D

func _input(event):
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		move_to_position(get_global_mouse_position())
		
	if Input.is_action_just_pressed("zoom_in"):
		var zoom_val =camera_2d.zoom.x + 0.1
		
		camera_2d.zoom = Vector2(zoom_val, zoom_val)
	elif Input.is_action_just_pressed("zoom_out"):
		var zoom_val =camera_2d.zoom.x - 0.1
		if zoom_val == 0:
			zoom_val =camera_2d.zoom.x - 0.2
			
		camera_2d.zoom = Vector2(zoom_val, zoom_val)
		
func _physics_process(delta):
	move(delta)
	
	const DAMAGE_RATE = 30.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()

