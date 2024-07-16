class_name StaticLink extends Node2D

func _physics_process(delta):
	var traps = get_tree().get_nodes_in_group("StaticTrap")
	if len(traps) < 2:
		$Line2D.set_process(false)
		$Area2D.set_process(false)
		return
	$Line2D.set_process(true)
	$Area2D.set_process(true)
	$Line2D.points = [to_local(traps[0].global_position), to_local(traps[1].global_position)]
	$Area2D/CollisionShape2D.shape.a = to_local(traps[0].global_position)
	$Area2D/CollisionShape2D.shape.b = to_local(traps[1].global_position)


func _on_area_2d_body_entered(body):
	body.queue_free()
