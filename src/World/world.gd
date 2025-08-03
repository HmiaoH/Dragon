class_name World
extends Node2D

@onready var bg_animation: BgAnimation = $BgAnimation
@onready var tile_animation: TileAnimation = $TileAnimation

func _on_change_state_timeout() -> void:
	bg_animation.change_speed(5)
	tile_animation.change_speed(10)
	print("chang_velocity")
	if bg_animation.animation_speed == bg_animation.MAX_SPEED:
		$ChangeState.queue_free()
