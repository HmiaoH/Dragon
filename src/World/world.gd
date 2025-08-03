class_name World
extends Node2D

var score: float = 0.0:
	set(value):
		score = value
		on_score_changed.emit(value)
var score_incremental: float = 0.5
var obstacles: Array[Area2D] = []

signal on_score_changed(value)

@onready var bg_animation: BgAnimation = $BgAnimation
@onready var tile_animation: TileAnimation = $TileAnimation

func _on_change_state_timeout() -> void:
	bg_animation.change_speed(5)
	tile_animation.change_speed(10)

	print("chang_velocity")
	if bg_animation.animation_speed <= bg_animation.MAX_SPEED:
		$ChangeState.queue_free()

	score_incremental += 0.5


func _on_add_score_timer_timeout() -> void:
	score += score_incremental
