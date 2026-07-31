extends CharacterBody2D

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
