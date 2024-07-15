class_name RegularMovement extends Node


const WALK_SPEED = 300.0
const ACCELERATION_SPEED = WALK_SPEED * 6.0
const JUMP_VELOCITY = -725.0
const TERMINAL_VELOCITY = 700
@export var action_suffix := ""

var gravity: int = ProjectSettings.get("physics/2d/default_gravity")

@onready var game = get_tree().get_root().get_node('Game');
@onready var player = game.get_player();
@onready var sprite = player.get_node("Sprite2D");


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump" + action_suffix):
		try_jump()
	elif Input.is_action_just_released("jump" + action_suffix) and player.velocity.y < 0.0:
		player.velocity.y *= 0.6
		
	player.velocity.y = minf(TERMINAL_VELOCITY, player.velocity.y + gravity * delta)

	var direction := Input.get_axis("move_left" + action_suffix, "move_right" + action_suffix) * WALK_SPEED
	player.velocity.x = move_toward(player.velocity.x, direction, ACCELERATION_SPEED * delta)

	if not is_zero_approx(player.velocity.x):
		if player.velocity.x > 0.0:
			sprite.scale.x = 1.0
		else:
			sprite.scale.x = -1.0

	player.move_and_slide()

func try_jump() -> void:
	player.velocity.y = JUMP_VELOCITY
