class_name Kvadrat extends Node2D

@onready var cell_scene = preload("res://perks/combat/kvadrat/cell.tscn")
var cell_size = 40
var grid_size = 5
var selected_coords: Vector2i = Vector2i.ZERO
var cells = []

func get_by_coords(coords):
	return cells[coords.x][coords.y]

func select(new_coords):
	get_by_coords(selected_coords).set_active(false)
	get_by_coords(new_coords).set_active(true)
	selected_coords = new_coords
	
func select_dir(dir):
	var new_coords = selected_coords + dir
	new_coords.x = clampi(new_coords.x, 0, grid_size - 1)
	new_coords.y = clampi(new_coords.y, 0, grid_size - 1)
	select(new_coords)

func _ready():
	for i in range(grid_size):
		cells.append([])
		for j in range(grid_size):
			var cell = cell_scene.instantiate()
			add_child(cell)
			cell.position = cell_size * Vector2(i - grid_size / 2, j - grid_size / 2)
			cells[i].append(cell)
	select(selected_coords)

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.as_text() == 'Up':
			select_dir(Vector2i.UP)
		if event.as_text() == 'Right':
			select_dir(Vector2i.RIGHT)
		if event.as_text() == 'Down':
			select_dir(Vector2i.DOWN)
		if event.as_text() == 'Left':
			select_dir(Vector2i.LEFT)
		
