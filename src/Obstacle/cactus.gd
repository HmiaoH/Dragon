class_name Cactus
extends Area2D

func move(delta: float, speed: int) -> void:
	position.x += delta * speed

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"): #考虑到小恐龙player不止一个，到时候记得将玩家分组
		body.set_health()
