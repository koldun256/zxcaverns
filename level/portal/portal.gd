extends Area2D
@onready var game = get_tree().get_root().get_node('Game') as Game

func _on_body_entered(body):
	game.restart()
