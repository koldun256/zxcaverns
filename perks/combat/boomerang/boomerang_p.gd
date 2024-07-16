extends Perk

@onready var game = get_tree().get_root().get_node('Game');
@onready var player = game.get_player();
@onready var boomerang = preload("res://perks/combat/boomerang/boomerang.tscn")

func _ready():
	player.add_child(boomerang.instantiate())
