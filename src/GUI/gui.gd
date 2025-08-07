class_name  GUI
extends Control

@onready var health_grid_container: GridContainer = $HealthPanel/HealthGridContainer
@onready var score_board: Label = $ScoreBoard
@onready var restart_menu: Control = $RestartMenu
@onready var start_menu: Control = $StartMenu
@onready var health_panel: PanelContainer = $HealthPanel
const apple = preload("res://src/GUI/Apple.tscn")

func _ready() -> void:
	update_health_grid(3)

func update_score_board(player_score: int):
	score_board.text = "SCORE: " + str(player_score)

func update_health_grid(player_health: int):
	for i in health_grid_container.get_children():
		i.queue_free()
	for i in player_health:
		var apple_rect = apple.instantiate()
		health_grid_container.add_child(apple_rect)

func troggle_to_restart_menu():
	restart_menu.visible = true
	start_menu.visible = false
	health_panel.visible = false
	score_board.visible = false
	get_tree().paused = true

func troggle_to_start_menu():
	restart_menu.visible = false
	start_menu.visible = true
	health_panel.visible = false
	score_board.visible = false
	get_tree().paused = true

func gui_start_game():
	restart_menu.visible = false
	start_menu.visible = false
	health_panel.visible = true
	score_board.visible = true
	get_tree().paused = false

func _on_start_game_button_pressed() -> void:
	gui_start_game()

func _on_restart_game_button_pressed() -> void:
	gui_start_game()
