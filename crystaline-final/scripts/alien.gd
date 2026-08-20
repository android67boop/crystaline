extends CharacterBody2D
var health = 5
@export var speed: float = 200.0
@export var player: Node2D

func _physics_process(delta: float) -> void:
	if player:
		var relative_position = (player.global_position.x - global_position.x)
		var direction: int
		
		if relative_position < 0:
			direction = -1
		else:
			direction = 1
		
		velocity.x = direction * speed
		
		
		move_and_slide()


func _enemy_being_hit_by_bullet(body: Node2D) -> void:
	health -= 1
	print("hit")
	
	if health <= 0: 
		queue_free()
	
	
