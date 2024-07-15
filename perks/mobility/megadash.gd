class_name Megadash extends RegularMovement

var in_charge = false
var target:Vector2
var start:Vector2
func _physics_process(delta: float) -> void:
	if player.stunned:
		return
		
	if Input.is_action_just_pressed("move_action"):
		megadash(delta);
		
	if in_charge:
		player.velocity = ((target - player.get_position())).normalized()*3000
		if (target - start).dot(target - player.get_position()) < 0:
			in_charge = false
			player.velocity = Vector2.ZERO
		
	else:
		handle_vertical_movement(delta)

		handle_horizontal_movement(delta)
	
		
	if not is_zero_approx(player.velocity.x):
		if player.velocity.x > 0.0:
			sprite.scale.x = 1.0
		else:
			sprite.scale.x = -1.0
	player.move_and_slide()
	
	
func megadash(delta: float):
	
	player.get_stunned(1)
	await get_tree().create_timer(1).timeout
	in_charge = true
	target = player.get_global_mouse_position()
	start = player.get_position()
	
	
