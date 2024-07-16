class_name HookMovement extends RegularMovement

@onready var hook = preload("res://perks/mobility/hook/hook_pivot.tscn")
@onready var h = hook.instantiate()

var hooked = false
var hooked_pos = Vector2(0,0)
var radius = 0.0
var speed = 1.0
var angle = 0.0
var rotation_side = 0

func _ready():
	player.add_child(h)
	h.get_node("Sprite2D").hooked.connect(_on_sprite_2d_hooked)
	h.get_node("Sprite2D").unhooked.connect(_return_gravity)

func _physics_process(delta: float) -> void:
	if player.stunned:
		return

	player.velocity.y = minf(TERMINAL_VELOCITY, player.velocity.y + gravity*delta)

	if hooked:
		radius = h.get_child(0).distance
		circular_motion()

	if not is_zero_approx(player.velocity.x):
		if player.velocity.x > 0.0:
			sprite.scale.x = 1.0
		else:
			sprite.scale.x = -1.0
	player.move_and_slide()

func _on_sprite_2d_hooked(hooked_position):
	gravity = 0
	player.velocity.y = 0
	hooked = true
	hooked_pos = hooked_position
	player.velocity.y = move_toward(player.global_position.y, hooked_position.y, 10)
	rotation_side = sign(hooked_position.x-player.global_position.x)

func _return_gravity():
	gravity = ProjectSettings.get("physics/2d/default_gravity")
	hooked = false
	
func circular_motion():
	angle = (player.position-hooked_pos).angle()
	angle += speed * get_process_delta_time() * rotation_side
	var new_pos = Vector2(cos(angle),sin(angle)) * radius + hooked_pos
	
	player.velocity = (new_pos - player.global_position).normalized()*300
