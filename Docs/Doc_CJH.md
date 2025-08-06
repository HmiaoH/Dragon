# BgAnimation(Node2D)
管理背景图片的滚动
### 属性
- `animation_speed: int` 用于设定背景移动的速度，默认为-10
- `background_1: Sprite2D` 引用background，不做处理
- `background_2: Sprite2D` 同上
- `background_size: int` 背景尺寸
### 方法
- `_ready() -> void:`<br>设定背景尺寸, 得到**background_1**的纹理尺寸大小与缩放比例, 二者相乘
- `_process(delta: float) -> void:` <br>背景的移动, 每秒背景的**position.x**加上**animation_speed**<br>如果有背景图到达相机的边缘, 就将其设置到初始位置
- `change_speed(change_value: int) -> void:`<br>更改背景滚动的速度, 调用时当前速度减去value, 并限制最大速度
### 常量
- `MAX_SPEED: int` 背景滚动的最大速度, 默认为-110
### 信号

# TileAnimation(Node2D)
管理地面图集的移动与碰撞
### 属性
- `animation_speed: int` 用于设定背景移动的速度，默认为-10
- `tile_map_layer_1: TileMapLayer` 引用TileMapLayer，不做处理
- `tile_map_layer_2: TileMapLayer` 同上
- `tile_map_layer_size: int` 背景尺寸
- `tile_size: int` 图块大小
### 方法
- `_ready() -> void:` 得到图块大小, 设定背景尺寸
- `_process(delta: float) -> void:` <br>TileMap的移动, 每秒背景的**position.x**加上**animation_speed**<br>如果有TileMap到达相机的边缘, 就将其设置到初始位置
- `change_speed(change_value: int) -> void:`<br>更改背景滚动的速度, 调用时当前速度减去value, 并限制最大速度
### 常量
- `MAX_SPEED: int` 背景滚动的最大速度, 默认为-300
### 信号
***
# World(Node2D)
统筹管理游戏世界的进程与效果
### 属性
- `bg_animation: BgAnimation` 得到背景动画的节点
- `tile_animation: TileAnimation` 得到瓦片动画的节点
- `score: float = 0.0` 分数, 其中有一 **setter**, 可以释放**on_score_changed**信号
- `score_incremental: float = 0.5` 分数每次增加的增量
- `obstacles: Array[Area2D] = []` 障碍物的数组, ==辄待更新==
### 方法
- `_on_change_state_timeout() -> void:` <br>在`ChangeState`节点倒计时结束后执行的操作, 包括
  - 改变动画的速度
  - 增加分数增量大小
  - 在地面移动速度到达最大时释放倒计时节点
- `_on_add_score_timer_timeout() -> void:`<br>在`AddScoreTimer`节点倒计时结束后执行的操作, 包括增加得分
### 常量
### 信号
- `on_score_changed(value)` 当改变得分时的信号, 发出改变后的得分

# Game(Node2D)
管理游戏与GUI的总节点
### 属性
- `score: int` 记录玩家的得分(计算方式为里程式)
- `world: Node2D` 游戏世界的节点, 用于获取游戏中的变量信号函数等
### 方法
- `_ready() -> void:`<br>将游戏世界中改变分数的信号连接到`_on_score_changed`函数
- `_on_score_changed(value) -> void:`<br>当改变分数时的操作, 有整型化改变后的value值, 并更新GUI的积分面板
### 常量
### 信号