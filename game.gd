class_name Game extends Node


@onready var _pause_menu := $InterfaceLayer/PauseMenu as PauseMenu

func get_player():
	return $"Level/Player" as Player
	
func get_level():
	return $Level as Node

func restart():
	get_tree().call_deferred("reload_current_scene")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"toggle_fullscreen"):
		var mode := DisplayServer.window_get_mode()
		if mode == DisplayServer.WINDOW_MODE_FULLSCREEN or \
				mode == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		get_tree().root.set_input_as_handled()

	elif event.is_action_pressed(&"toggle_pause"):
		var tree := get_tree()
		tree.paused = not tree.paused
		if tree.paused:
			_pause_menu.open()
		else:
			_pause_menu.close()
		get_tree().root.set_input_as_handled()
