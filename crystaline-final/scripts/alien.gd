extends CharacterBody2D

var speed = 60
var direction = -1

func _physics_process(delta):
	
	if !$WallRay.is_colliding() or !$EdgeRay.is_colliding():
		
		direction *= -1
		
		scale.x *= -1

	velocity.x = speed * direction
	
	
	move_and_slide()
