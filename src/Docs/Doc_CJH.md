# BgAnimation(Node2D)
管理背景图片的滚动
### 属性
- `animation_speed: int` 用于设定背景移动的速度，默认为-10
- `background_1: Sprite2D` 引用background，不做处理
- `background_2: Sprite2D` 同上
- `background_size: int` 背景尺寸
### 方法
- `_ready() -> void:` 设定背景尺寸, 得到**background_1**的纹理尺寸大小与缩放比例, 二者相乘
- `_process(delta: float) -> void:` <br>背景的移动, 每秒背景的**position.x**加上**animation_speed**<br>如果有背景图到达相机的边缘, 就将其设置到初始位置
- `change_speed(change_value: int) -> void:` 更改背景滚动的速度, 调用时当前速度减去value, 并限制最大速度
### 常量
- `MAX_SPEED: int` 背景滚动的最大速度, 默认为-60
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
- `change_speed(change_value: int) -> void:` 更改背景滚动的速度, 调用时当前速度减去value, 并限制最大速度
### 常量
- `MAX_SPEED: int` 背景滚动的最大速度, 默认为-200
### 信号

# World(Node2D)
统筹管理游戏世界的进程与效果
### 属性
- `bg_animation: BgAnimation` 得到背景动画的节点
- `tile_animation: TileAnimation` 得到瓦片动画的节点
### 方法
- `func _on_change_state_timeout() -> void:` 在`ChangeState`节点倒计时结束后执行的操作, 包括改变动画的速度, 
### 常量
### 信号
