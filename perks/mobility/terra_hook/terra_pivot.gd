class_name TerraPivot extends Node2D

@onready var ray_cast = $RayCast2D
@onready var line_array = [$"../TerraHook",$"../TerraHook2",$"../TerraHook3",$"../TerraHook4"]

var line_dict = {
	0: Vector2(0,0),
	1: Vector2(0,0),
	2: Vector2(0,0),
	3: Vector2(0,0)
}

signal hooked(hooked_position)

var beginning_position
var end_position
var i = 0

func _process(delta):
	if Input.is_action_just_pressed("hook_and_stuff"):
		look_at(get_global_mouse_position())
	if i > 3:
		i = 0
	for i in range(0,4):
		if line_dict[i] != Vector2(0,0) and line_array[i].check_state():
			line_array[i].reattach(line_array[i].to_local(global_position), line_array[i].to_local(line_dict[i]))

func _input(event):
	if event.is_action_pressed("hook_and_stuff"):
		if line_array[i].check_state():
			await check_collision()

func check_collision():
	await get_tree().create_timer(0.1).timeout
	if ray_cast.is_colliding():
		beginning_position = line_array[i].to_local(global_position)
		line_dict[i] = ray_cast.get_collision_point()
		end_position = line_array[i].to_local(line_dict[i])
		line_array[i].hook_to(beginning_position, end_position)
		i += 1
	else:
		line_dict[i] = Vector2(0,0)
		beginning_position = line_array[i].to_local(global_position)
		end_position = line_array[i].to_local(get_global_mouse_position())
		line_array[i].miss(beginning_position, end_position)

func _on_terra_hook_hooked(hooked_position):
	hooked.emit(line_array[i].to_global(end_position))
