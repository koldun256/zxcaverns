class_name Pivot extends Node2D

var hooked = false
var hooked_to = Vector2(0,0)

func _process(delta):
	if hooked:
		look_at(hooked_to)
	if Input.is_action_just_pressed("hook_and_stuff"):
		look_at(get_global_mouse_position())


func _on_sprite_2d_hooked(hooked_position):
	hooked = true
	hooked_to = hooked_position


func _on_sprite_2d_unhooked():
	hooked = false
