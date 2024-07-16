class_name Komar extends CharacterBody2D

@export var speed = 200
@export var patrol_range = 300

var player = null
var is_player_detected = false

var patrol_position = Vector2.ZERO
var patrol_direction = 1

func _ready():
	patrol_position = position
	$PatrolTimer.start()

func _physics_process(delta):
	if player and is_player_detected:
		move_towards_player()
	else:
		patrol()

func move_towards_player():
	var direction = (player.position - position).normalized()
	velocity = direction * speed
	move_and_slide()

func patrol():
	return
	var direction = (patrol_position - position).normalized()
	velocity = direction * speed
	move_and_slide()
	
	if abs(patrol_position.x - position.x) >= patrol_range:
		patrol_direction *= -1
		$PatrolTimer.start()

func _on_DetectionArea_body_entered(body):
	if body is Player:
		player = body
		is_player_detected = true

func _on_DetectionArea_body_exited(body):
	if body is Player:
		player = null
		is_player_detected = false

func _on_timer_timeout():
	patrol_direction = randi() % 2 * 2 - 1
