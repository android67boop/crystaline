extends Area2D

const BULLET_DAMAGE = 1 

var target_position : Vector2 = Vector2.ZERO
var despawn_time := 5.0
var damage: int = BULLET_DAMAGE

@export var speed : int = 800

func _ready() -> void: 
	body_entered.connect(_on_body_entered)
	despawn()


func _physics_process(delta: float) -> void:
	#move the bullet in the direction it was fired
	global_position += target_position * speed * delta


func _on_body_entered(body: Node2D) -> void:
	#only damage objects in the alien group and then remove the bullet
	if body.is_in_group("alien"):
		body.take_damage(damage)
		queue_free()


func despawn() -> void:
	#remove the bullet after 5 seconds so unused bullets do not stay in the game
	await get_tree().create_timer(despawn_time).timeout
	queue_free()
