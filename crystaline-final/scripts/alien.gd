extends CharacterBody2D

var speed = 60
var direction = 1

func _physics_process(delta):
	
	if !$RayCast2D.is_colliding() or !$RayCast2D2.is_colliding():
		direction *= -1
		


	velocity.x = speed * direction
	
	
	move_and_slide()
