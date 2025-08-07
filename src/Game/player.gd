extends CharacterBody2D
#重力加速度和跳跃初速度
@export var gravity:float=20.0#这俩数值因为还没放到动画里面所以随便写的后续估计还得调整
@export var jumpspeed:float=-100.0
@export var maxhealth:int=60#生命值上限
var currhealth:int #当前生命值
@onready var animated_sprite = $AnimatedSprite2D#animated_sprite方便给角色加动画
var isdead=false#是否死亡
enum AnimationState { RUN, DIE}#人物状态，跑步或者死亡

#sethealth函数
func set_health():
	
#准备函数
func _ready():
	currhealth=maxhealth
	animated_sprite.play("run") #因为人物没有初速度所以开局就是跑步姿势
	 $DamageArea.body_entered.connect(_on_damage_area_body_entered)#碰到障碍物

func _physics_process(delta):
	if isdead:
		return  # 死亡后停止物理逻辑

	# 1. 应用重力
	velocity.y += gravity * delta

	# 2. 跳跃逻辑（仅地面可跳）
	if Input.is_action_just_pressed("jumping") and is_on_floor():#jumping和空格键定
		velocity.y = jumpspeed

	# 3. 动画状态切换（根据角色状态）
	_update_animation_state()

	# 4. 移动与滑动（无水平速度，仅处理垂直方向）
	velocity.x = 0  # 强制水平速度为0
	move_and_slide()  # 应用物理移动


# 动画状态更新逻辑
func _update_animation_state():
	if isdead:#如果死了
		current_state = AnimationState.DIE
		animated_sprite.play("die")
		return

	# 根据状态切换动画
	match current_state:
		AnimationState.RUN:
			animated_sprite.play("run") 
		AnimationState.DIE:
			animated_sprite.play("die")

#后面的都看不懂了，，，
# 处理与障碍物的碰撞（死亡逻辑）
func _on_damage_area_body_entered(body):
	# 假设障碍物是 StaticBody2D 或其他碰撞体（需根据实际场景调整）
	if body.is_in_group("cactus"):  # 碰到仙人掌扣十滴血
		currhealth -= 10  
		elif body.is_in_group("birds"):#碰到鸟扣二十滴血
			currhealth-=20
		if currhealth <= 0:
			die()


# 死亡函数
func die():
	isdead = true
	current_state = AnimationState.DIE
	animated_sprite.play("die")
	$CollisionShape2D.set_deferred("disabled", true)  # 禁用碰撞体
	# 死亡后延迟重启场景（或跳转游戏结束界面）
	await get_tree().create_timer(1.0).timeout
	get_tree().reload_current_scene()	

	#run,die这俩动画还没加（不知道为啥打不开）
	#角色碰撞逻辑还没对接
	#上面碰障碍物那一块函数应该还是有点问题
