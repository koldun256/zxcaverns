class_name PerksUI extends HBoxContainer

@onready var perk_ui_scene = preload("res://gui/PerksUI/perk_ui.tscn")

func _on_perks_on_set_perks(perks):
	for perk in perks:
		var perk_ui = perk_ui_scene.instantiate()
		perk_ui.texture = perk.icon
		add_child(perk_ui)
