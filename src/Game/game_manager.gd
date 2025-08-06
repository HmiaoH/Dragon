class_name Game
extends Node2D

var score: int = 0

@onready var world: Node2D = $World

func _ready() -> void:
    world.on_score_changed.connect(_on_score_changed)

func _on_score_changed(value) -> void:
    score = int(value)
    $Label.text = "SCORE: " + str(score)