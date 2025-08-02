# BgAnimation(Node2D)
### 属性
- `animation_speed: int` 用于设定背景移动的速度，默认为-10
- `background_1: Sprite2D` 引用background，不做处理
- `background_2: Sprite2D` 同上
- `background_size: int` 背景尺寸
### 方法
- `_ready() -> void:` 设定背景尺寸, 得到**background_1**的尺寸大小
- `_process(delta: float) -> void:` <br>背景的移动, 每秒背景的**position.x**加上**animation_speed**<br>如果有背景图到达相机的边缘, 就将其设置到初始位置
### 常量
### 信号

# TileAnimation(Node2D)
### 属性
- `animation_speed: int` 用于设定背景移动的速度，默认为-10
- `tile_map_layer_1: TileMapLayer` 引用TileMapLayer，不做处理
- `tile_map_layer_2: TileMapLayer` 同上
- `tile_map_layer_size: int` 背景尺寸
- `tile_size: int` 图块大小
### 方法
- `_ready() -> void:` 得到图块大小, 设定背景尺寸
- `_process(delta: float) -> void:` <br>TileMap的移动, 每秒背景的**position.x**加上**animation_speed**<br>如果有TileMap到达相机的边缘, 就将其设置到初始位置
### 常量
### 信号
