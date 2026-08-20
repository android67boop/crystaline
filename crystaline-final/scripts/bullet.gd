extends CharacterBody2D

@export var speed : int = 800
var target_position: Vector2 = Vector2.ZERO
var despawn_time = 5

func _ready() -> void: 
	despawn()


func _physics_process(delta: float) -> void:
	velocity = target_position * speed
	move_and_slide()


func despawn() -> void:
	await get_tree().create_timer(despawn_time).timeout
	queue_free()
