class_name Player
extends CharacterBody2D

var health: int:
	set(value):
		health = value
		on_health_changed.emit(value)

const MAX_HEALTH = 3
const SPEED = 300.0
const JUMP_VELOCITY = -300.0
const GRAVITY = 980

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

signal on_health_changed(value: int)
signal on_game_over()

func _ready() -> void:
	health = MAX_HEALTH


func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta

	if is_on_floor():
		animated_sprite.play("run")

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y += JUMP_VELOCITY
		animated_sprite.play("jump")
		
	
	move_and_slide()

func set_health(value: int):
	health += value
	animated_sprite.play("hurt")
	if health == 0:
		on_game_over.emit()