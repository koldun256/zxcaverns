class_name SuperRegular extends RegularMovement

var number_of_jumps = 4

func handle_vertical_movement(delta: float, _gravity = gravity) -> void:
	if player.is_on_floor():
		number_of_jumps = 4
	if Input.is_action_just_pressed("jump") and number_of_jumps > 0:
		try_jump()
		number_of_jumps -= 1
	player.velocity.y = minf(TERMINAL_VELOCITY, player.velocity.y + _gravity * delta)

func handle_horizontal_movement(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right") * WALK_SPEED * 3
	player.velocity.x = move_toward(player.velocity.x, direction, ACCELERATION_SPEED * delta)
