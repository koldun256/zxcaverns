class_name Rock extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	velocity.y += gravity * delta
	move_and_slide()
	for i in get_slide_collision_count():
		velocity.x = 0

func _on_area_2d_body_entered(body):
	if body.is_in_group('Enemy'):
		body.queue_free()
		
	if body is Player and (velocity - body.velocity).dot(global_position - body.global_position) < 0:
		body.get_node("RockWeapon").give_rock()
		queue_free()
