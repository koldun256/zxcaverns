class_name Bullet extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	velocity.y += gravity * delta
	
	for i in get_slide_collision_count():
		var other = get_slide_collision(i).get_collider()
		if other.is_in_group('Enemy'):
			other.destroy()
	
	if get_slide_collision_count() > 0:
		queue_free()

	move_and_slide()
