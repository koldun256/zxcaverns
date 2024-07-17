class_name TerraHookPerk extends WalkPerk

@onready var hook = preload("res://perks/mobility/terra_hook/TerraHook.tscn")
@onready var h = hook.instantiate()

var go_to = Vector2(0,0)
var points_array = []

func _ready():
	player.add_child(h)
	h.position.y -= 20
	h.get_node("Pivot").hooked.connect(_add_point_to_array)

func _physics_process(delta):
	if player.stunned:
		return
	
	handle_terra_hook()
	
	if not is_zero_approx(player.velocity.x):
		if player.velocity.x > 0.0:
			sprite.scale.x = 1.0
		else:
			sprite.scale.x = -1.0
	player.move_and_slide()

func handle_terra_hook():
	if len(points_array) == 0:
		return
	if len(points_array) == 4:
		points_array.remove_at(0)
	go_to = Vector2(0,0  )
	for i in points_array:
		go_to += i
	go_to = go_to / len(points_array)
	player.position = player.position.move_toward(go_to, get_process_delta_time()*400) 

func _add_point_to_array(hooked_position):
	points_array.append(hooked_position)
