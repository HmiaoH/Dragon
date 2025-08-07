class_name TileAnimation
extends Node2D


@export var animation_speed: int = -100

@onready var tile_map_layer_1: TileMapLayer = $TileMapLayer
@onready var tile_map_layer_2: TileMapLayer = $TileMapLayer2
@onready var obstacle_manager: ObstacleManager = $ObstacleManager
const MAX_SPEED: int = -300

var tile_map_layer_size: int
var tile_size: int

func _ready() -> void:
	tile_size = tile_map_layer_1.tile_set.tile_size.x
	tile_map_layer_size = tile_map_layer_1.get_used_rect().size.x * tile_size - 1

func _physics_process(delta: float) -> void:
	tile_map_layer_1.position.x += animation_speed * delta
	tile_map_layer_2.position.x += animation_speed * delta

	if tile_map_layer_1.position.x <= -1 * tile_map_layer_size:
		tile_map_layer_1.position.x = tile_map_layer_size
	elif tile_map_layer_2.position.x <= -1 * tile_map_layer_size:
		tile_map_layer_2.position.x = tile_map_layer_size

func change_speed(change_value: int) -> void:
	animation_speed = clampi(animation_speed - change_value, MAX_SPEED, animation_speed)
	obstacle_manager.obstacle_move_speed = animation_speed
	print(animation_speed)
