class_name RockPerk extends Perk

@onready var game = get_tree().get_root().get_node('Game');
@onready var player = game.get_player();
@onready var rock_weapon = preload("res://perks/combat/rock/rock_weapon.tscn")

func _ready():
	player.add_child(rock_weapon.instantiate())
