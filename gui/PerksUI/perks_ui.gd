class_name PerksUI extends HBoxContainer

func _on_perks_on_set_perks(perks):
	var perk_ui_scene = load("res://gui/PerksUI/perk_ui.tscn")
	for perk in perks:
		var perk_ui = perk_ui_scene.instantiate()
		perk_ui.texture = perk.icon
		add_child(perk_ui)
