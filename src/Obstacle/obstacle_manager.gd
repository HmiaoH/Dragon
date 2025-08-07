class_name ObstacleManager
extends Node2D

@onready var cactus_scene = preload("res://src/Obstacle/cactus.tscn")
@onready var bird_scene = preload("res://src/Obstacle/bird.tscn")
@onready var timer: Timer = $Timer
# 2. 障碍物容器（方便管理生成的障碍物）
@onready var obstacle_container: Node2D = $ObstacleContainer

var obstacle_move_speed: int = 0:
	set(value):
		obstacle_move_speed = value
		timer.wait_time -= 0.07

const init_position_x := 408 
const init_position_y := 32

# 3. 障碍物数组（对应思维导图里的“障碍物(数组)”）
var obstacles_scenes: Array[PackedScene] = []
var obstacles: Array = []

func _ready():
	# 初始化：把预制体存入数组（方便 pick_random 随机选）
	obstacles_scenes.append(cactus_scene)
	obstacles_scenes.append(bird_scene)

func _physics_process(delta: float) -> void:
	for i in obstacle_container.get_children():
		i.move(delta, obstacle_move_speed)

# 4. 随机选障碍物并生成
func _generate_obstacle():
	# 随机选预制体
	var random_obstacle: PackedScene = obstacles_scenes.pick_random()
	
	# 生成节点
	var obstacle = random_obstacle.instantiate()
	obstacle_container.add_child(obstacle)
	
	if random_obstacle == bird_scene: # 如果预制体是鸟的话…………
	# 初始化位置（比如从屏幕右侧外生成）
		obstacle.position = Vector2(init_position_x, randf_range(-5, 32)) # 随机高度
	else:
		obstacle.position = Vector2(init_position_x, init_position_y)
