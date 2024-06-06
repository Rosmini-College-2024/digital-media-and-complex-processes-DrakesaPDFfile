extends CharacterBody2D


@export var speed: float = 3000.0

var difference: Vector2 = Vector2.ZERO

var target_destination: Vector2 = Vector2.ZERO

var destination_margin: float = 20.0

func move_to_position(pos: Vector2) -> void:
	target_destination = pos
	
	difference = target_destination - self.global_position
	
	
func move(delta)-> void:
	
	var distance_from_destination: float = (target_destination - self.global_position).length()
	
	if distance_from_destination < destination_margin:
		return

	velocity = difference
	
	velocity = velocity.normalized()
	
	velocity *= speed
	
	move_and_slide()
