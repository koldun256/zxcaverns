class_name HookMovement extends RegularMovement

@onready var hook = preload("res://perks/mobility/hook/hook_pivot.tscn")

func _ready():
	var h = hook.instantiate()
	player.add_child(h)
	h.get_node("Sprite2D").hooked.connect(_on_sprite_2d_hooked)

func _physics_process(delta: float) -> void:
	handle_vertical_movement(delta)
	
	handle_graple(delta)

	handle_horizontal_movement(delta)

	if not is_zero_approx(player.velocity.x):
		if player.velocity.x > 0.0:
			sprite.scale.x = 1.0
		else:
			sprite.scale.x = -1.0
	player.move_and_slide()

func handle_graple(delta:float) -> void:
	pass

func _on_sprite_2d_hooked(hooked_position):
	var tween = get_tree().create_tween()
	tween.tween_property(player, "position", hooked_position, 0.3)
