class_name DndPerk extends Perk

var mouse_on_player = false
@onready var game = get_tree().get_root().get_node("Game")
@onready var player = game.get_player()
@onready var level = game.get_level()
@onready var camera = player.get_node("Camera") as Camera2D
var camera_pivot: Node2D
var dragging = false

func start_drag():
	camera_pivot = Node2D.new()
	level.add_child(camera_pivot)
	camera_pivot.global_position = player.global_position
	
	player.remove_child(camera)
	camera_pivot.add_child(camera)
	
	dragging = true

func end_drag():
	camera_pivot.remove_child(camera)
	player.add_child(camera)
	camera_pivot.queue_free()
	
	dragging = false

func _on_player_mouse_entered():
	mouse_on_player = true
	
func _on_player_mouse_exited():
	mouse_on_player = false
	
func _ready():
	player.mouse_entered.connect(_on_player_mouse_entered)
	player.mouse_exited.connect(_on_player_mouse_exited)
	
func _physics_process(delta):
	var pressed = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
	
	if not dragging and pressed and mouse_on_player:
		start_drag()
		
	if dragging and not pressed:
		end_drag()
		
	if dragging:
		move_to(player.get_global_mouse_position())

func move_to(target):
	if (player.global_position - target).length() < 5:
		player.velocity = Vector2.ZERO
	else:
		player.velocity = (target - player.global_position).normalized() * 600
