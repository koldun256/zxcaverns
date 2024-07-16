class_name Hook extends Sprite2D

@onready var ray_cast = $RayCast2D
var distance: float = 999.0
var max_distance: float = 999.0
var collision_point
var ishooked = false

signal hooked(hooked_position)
signal unhooked()

func interpolate(length, duration = 0.2):
	var tween_offset = get_tree().create_tween()
	var tween_rect_h = get_tree().create_tween()
 
	tween_offset.tween_property(self, "offset",Vector2(0,length/2.0), duration)
	tween_rect_h.tween_property(self, "region_rect", Rect2(0,0,30,length), duration)

#func _process(delta):
	#if Input.is_action_pressed("jump") and collision_point and get_region_rect().size.y>0:
		#var length = global_position.direction_to(collision_point)
		#global_position += length
		#region_rect = Rect2(0,0,30,get_region_rect().size.y-abs(length.length())) 

func _input(event):
	if event.is_action_pressed("hook_and_stuff") and not ishooked:
		if not await check_collision():
			interpolate(distance, 0.09)
			ishooked = true
			await get_tree().create_timer(0.15).timeout
			reverse_interpolate()
			ishooked = false
			return
		else:
			interpolate(distance)
			ishooked = true
	if event.is_action_released("hook_and_stuff") and ishooked:
		position = get_parent().position
		reverse_interpolate()
		ishooked = false
		unhooked.emit()

func reverse_interpolate():
	interpolate(0,0.2)
 
func check_collision():
	await get_tree().create_timer(0.15).timeout
	if ray_cast.is_colliding():
		collision_point = ray_cast.get_collision_point()
		distance = (global_position - collision_point).length()
		hooked.emit(collision_point)
		return true
	else:
		collision_point = 0
		distance = 999.0
	return false
