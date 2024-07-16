extends Perk

@onready var game = get_tree().get_root().get_node('Game');
@onready var player = game.get_player();
@onready var static_trap_weapon = preload("res://perks/combat/static_trap/static_trap_weapon.tscn")

func _ready():
	player.add_child(static_trap_weapon.instantiate())
