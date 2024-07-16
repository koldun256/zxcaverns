class_name KvadratPerk extends Perk

@onready var game = get_tree().get_root().get_node('Game');
@onready var player = game.get_player();
@onready var kvadrat = preload("res://perks/combat/kvadrat/kvadrat.tscn")

func _ready():
	player.add_child(kvadrat.instantiate())
