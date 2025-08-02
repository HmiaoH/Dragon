class_name TileAnimation
extends Node2D

@export var animation_speed: int = -100

@onready var tile_map_layer_1: TileMapLayer = $TileMapLayer
@onready var tile_map_layer_2: TileMapLayer = $TileMapLayer2

var tile_map_layer_size: int
var tile_size: int

func _ready() -> void:
    tile_size = tile_map_layer_1.tile_set.tile_size.x
    tile_map_layer_size = tile_map_layer_1.get_used_rect().size.x * tile_size

func _physics_process(delta: float) -> void:
    tile_map_layer_1.position.x += animation_speed * delta
    tile_map_layer_2.position.x += animation_speed * delta

    if tile_map_layer_1.position.x <= -1 * tile_map_layer_size:
        tile_map_layer_1.position.x = tile_map_layer_size
    elif tile_map_layer_2.position.x <= -1 * tile_map_layer_size:
        tile_map_layer_2.position.x = tile_map_layer_size