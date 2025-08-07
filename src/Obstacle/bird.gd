class_name Bird
extends Area2D

func move(delta: float, speed: int) -> void:
	position.x += delta * speed