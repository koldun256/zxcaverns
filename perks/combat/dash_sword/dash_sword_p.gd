extends Perk

@onready var game = get_tree().get_root().get_node('Game');
@onready var player = game.get_player();
@onready var sword = preload("res://perks/combat/dash_sword/dash_weapon.tscn")

func _ready():
	player.add_child(sword.instantiate())
