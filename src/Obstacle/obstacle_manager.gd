
extends Node2D

# 1. 关联预制体（在编辑器里拖进去！）
@export var cactus_scene: PackedScene  # 关联 Cactus.tscn
@export var bird_scene: PackedScene    # 关联 Bird.tscn

# 2. 障碍物容器（方便管理生成的障碍物）
@onready var obstacle_container: Node2D = $ObstacleContainer

# 3. 障碍物数组（对应思维导图里的“障碍物(数组)”）
var obstacles = []

func _ready():
	# 初始化：把预制体存入数组（方便 pick_random 随机选）
	obstacles.append(cactus_scene)
	obstacles.append(bird_scene)
	
	# 可选：自动开始生成障碍物（也可以用定时器或游戏事件触发）


# 4. 随机选障碍物并生成
func _generate_obstacle():
	# 随机选预制体
	var random_obstacle = obstacles.pick_random()
	
	# 生成节点
	var obstacle = random_obstacle.instantiate()
	obstacle_container.add_child(obstacle)
	
	if random_obstacle == bird_scene: #如果预制体是鸟的话…………
	# 初始化位置（比如从屏幕右侧外生成）
		obstacle.position = Vector2(204, randf_range(-5, 32))  # 随机高度
	else :
		obstacle.position = Vector2(204, 32)  
		
	
	



# 6. 碰撞检测（如果用全局 HitBox）
func _on_hit_box_area_entered(area):
	# area 是触发碰撞的节点（比如玩家）
	if area.is_in_group("Player"):
		print("撞到障碍物！")
		# 这里写碰撞逻辑：扣血、游戏结束等
