extends Perk

@onready var game = get_tree().get_root().get_node('Game');
@onready var player = game.get_player();
@onready var gun = preload("res://perks/combat/gun/gun.tscn")

func _ready():
	player.add_child(gun.instantiate())
