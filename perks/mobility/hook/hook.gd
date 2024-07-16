class_name Hook extends Sprite2D

@onready var ray_cast = $RayCast2D
var distance: float = 200.0
var collision_point

signal hooked(hooked_position)

func interpolate(length, duration = 0.2):
	var tween_offset = get_tree().create_tween()
	var tween_rect_h = get_tree().create_tween()
 
	tween_offset.tween_property(self, "offset",Vector2(0,length/2.0), duration)
	tween_rect_h.tween_property(self, "region_rect", Rect2(0,0,30,length), duration)

func _process(delta):
	if Input.is_action_pressed("jump") and collision_point and get_region_rect().size.y>0:
		var length = global_position.direction_to(collision_point)
		global_position += length
		region_rect = Rect2(0,0,30,get_region_rect().size.y-abs(length.length())) 

func _input(event):
	if event.is_action_pressed("hook_and_stuff"):
		if not await check_collision():
			interpolate(distance, 0.2)
			await get_tree().create_timer(0.15).timeout
			reverse_interpolate()
			return
		else:
			interpolate(distance, 0.2)
	if event.is_action_released("hook_and_stuff"):
		position = get_parent().position
		reverse_interpolate()

func reverse_interpolate():
	interpolate(0,0.7)
 
func check_collision():
	await get_tree().create_timer(0.1).timeout
	if ray_cast.is_colliding():
		collision_point = ray_cast.get_collision_point()
		distance = (global_position - collision_point).length()
		hooked.emit(collision_point)
		return true
	else:
		collision_point = 0
		distance = 200.0
	return false
