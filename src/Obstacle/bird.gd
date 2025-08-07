class_name Bird
extends Area2D

func move(delta: float, speed: int) -> void:
	position.x += delta * speed

func _on_body_entered(body: Player) -> void:
	body.set_health( -1 )
