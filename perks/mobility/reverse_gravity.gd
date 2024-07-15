class_name ReverseGravity extends RegularMovement

func handle_vertical_movement(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		gravity = -gravity
		sprite.scale.y = gravity/abs(gravity)
	player.velocity.y = minf(TERMINAL_VELOCITY, player.velocity.y + gravity * delta)
