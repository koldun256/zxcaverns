class_name TerraHook extends Line2D

enum State {idle, hooking, hooked, missed}
var hook_state = State.idle
var beginning_position
var cur_point_position = -1627836178263187418
var end_position = -17293198732198732

signal hooked(hooked_position)

func _process(delta):
	if hook_state == State.hooking and cur_point_position != end_position:
		cur_point_position = cur_point_position.move_toward(end_position, delta*800) 
		points = [beginning_position, cur_point_position]
	elif cur_point_position == end_position and hook_state != State.hooked:
		hooked.emit(end_position)
		hook_state = State.hooked
	if hook_state == State.missed:
		cur_point_position = cur_point_position.move_toward(end_position, delta*800) 
		points = [beginning_position, cur_point_position]
		await get_tree().create_timer(0.2).timeout
		clear_points()
		hook_state = State.idle

func hook_to(from: Vector2, to_position: Vector2):
	beginning_position = from
	cur_point_position = beginning_position
	end_position = to_position
	hook_state = State.hooking

func miss(from: Vector2, to_position: Vector2):
	beginning_position = from
	cur_point_position = beginning_position
	end_position = to_position
	hook_state = State.missed

func check_state() -> bool:
	if hook_state == State.missed or hook_state == State.hooking:
		return false
	else:
		return true

func reattach(from: Vector2, to_position: Vector2):
	points = [from, to_position]
