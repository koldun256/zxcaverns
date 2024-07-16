class_name Bullet extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	velocity.y += gravity * delta
	
	for i in get_slide_collision_count():
		if get_slide_collision(i).get_collider() is Enemy:
			get_slide_collision(i).get_collider().destroy()
	
	if get_slide_collision_count() > 0:
		queue_free()

	move_and_slide()
