class_name Projectile extends CharacterBody2D

func _physics_process(delta):
	for i in get_slide_collision_count():
		var other = get_slide_collision(i).get_collider()
		if other is Player:
			other.die()

	move_and_slide()
