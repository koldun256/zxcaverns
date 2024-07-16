class_name BoomerangProjectile extends CharacterBody2D

@onready var game = get_tree().get_root().get_node('Game')
@onready var player = game.get_player()
@onready var boomerang = player.get_node('Boomerang')

func _physics_process(delta):
	if velocity.normalized().dot((player.global_position - global_position).normalized()) < 0: 
		velocity *= 0.99
	velocity -= (global_position - player.global_position) * delta
	print(velocity.normalized().dot((player.global_position - global_position).normalized()))
	for i in get_slide_collision_count():
		var other = get_slide_collision(i).get_collider()
		if not other:
			continue
		if other.is_in_group('Enemy'):
			other.queue_free()
		if other is Player:
			print("111")
			boomerang.is_thrown = false
			queue_free()

	move_and_slide()
