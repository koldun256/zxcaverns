class_name GravityPerk extends WalkPerk

func handle_vertical_movement(delta: float, _gravity = gravity) -> void:
	if Input.is_action_just_pressed("jump"):
		gravity = -gravity
		sprite.scale.y = gravity/abs(gravity)
	player.velocity.y = minf(TERMINAL_VELOCITY, player.velocity.y + _gravity * delta)
