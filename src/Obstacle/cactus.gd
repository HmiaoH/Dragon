class_name Cactus
extends Area2D

@export var speed = -100
const  MAX_SPEED: int = -200

func _physics_process(delta: float) -> void:
	
	# 示例：左右移动 + 上下浮动
	position += Vector2(speed , 0) * delta

	#position.y += sin(Time.get_ticks_msec() / 500) * 2  # 简单上下浮动
	
	if position.x < -204:
		queue_free()

func change_speed(change_value: int = 10) -> void:
	speed = clampi(speed - change_value, MAX_SPEED, speed)




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"): #考虑到小恐龙player不止一个，到时候记得将玩家分组
		print("仙人掌撞到玩家！")
