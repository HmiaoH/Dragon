class_name Game
extends Node2D

var score: int = 0

@onready var gui: GUI = $GUI
@onready var world: Node2D = $World
@onready var player: Player = %Player

func _ready() -> void:
	world.on_score_changed.connect(gui.update_score_board)
	player.on_health_changed.connect(gui.update_health_grid)
	player.on_game_over.connect(game_over)
	if TotalUtils.first_initiate_scene:
		gui.troggle_to_start_menu()
	else :
		gui.troggle_to_restart_menu()


func game_over():
	TotalUtils.first_initiate_scene = false
	get_tree().paused = true
	await get_tree().create_timer(1.0).timeout
	get_tree().reload_current_scene()

	

	
