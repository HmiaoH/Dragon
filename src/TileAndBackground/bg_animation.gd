class_name BgAnimation
extends Node2D

@export var animation_speed: int = -6

@onready var background_1: Sprite2D = $Background
@onready var background_2: Sprite2D = $Background2

var background_size: int

func _ready() -> void:
    background_size = background_1.texture.get_width()

func _process(delta: float) -> void:
    background_1.position.x += animation_speed * delta
    background_2.position.x += animation_speed * delta

    if background_1.position.x <= -1 * background_size:
        background_1.position.x = background_size
    elif background_2.position.x <= -1 * background_size:
        background_2.position.x = background_size

func change_speed() -> void:
    pass