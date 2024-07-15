class_name Megadash extends RegularMovement

func _physics_process(delta: float) -> void:
	handle_vertical_movement(delta)

	handle_horizontal_movement(delta)
	if Input.is_action_just_pressed("move_action"):
		megadash(delta);
		
		
	if not is_zero_approx(player.velocity.x):
		if player.velocity.x > 0.0:
			sprite.scale.x = 1.0
		else:
			sprite.scale.x = -1.0
	player.move_and_slide()
	
	
func megadash(delta: float):
	pla
	await get_tree().create_timer(1).timeout
	print("222")
	player.move_toward(player.get_global_mouse_position(), delta)
	
	
