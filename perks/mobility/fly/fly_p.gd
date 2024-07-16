class_name FlyPerk extends WalkPerk

const FlY_SPEED = WALK_SPEED

func handle_vertical_movement(delta: float, _gravity = gravity) -> void:
	var direction := Input.get_axis("jump", "down") * FlY_SPEED
	player.velocity.y = move_toward(player.velocity.y, direction, ACCELERATION_SPEED * delta)
