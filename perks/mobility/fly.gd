class_name Fly extends RegularMovement

const FlY_SPEED = WALK_SPEED

func handle_vertical_movement(delta: float) -> void:
	var direction := Input.get_axis("jump", "down") * FlY_SPEED
	player.velocity.y = move_toward(player.velocity.y, direction, ACCELERATION_SPEED * delta)
