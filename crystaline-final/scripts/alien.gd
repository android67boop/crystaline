extends CharacterBody2D
var health = 5
var knockback = 0.0
@export var knockback_strength: float = 300.0
@export var speed: float = 200.0
@export var player: Node2D
@export var gem_scene: PackedScene
#func _physics_process(delta: float) -> void:
	#if player:
		#var relative_position = (player.global_position.x - global_position.x)
		#var direction: int
		
		#if relative_position < 0:
			#direction = 1
		
		#velocity.x = direction * speed
		
		
func _physics_process(delta: float) -> void:
	if knockback != 0:
		velocity.x = knockback
		knockback = move_toward(knockback, 0, 40)
		
	elif player:
		var relative_position = (player.global_position.x - global_position.x)
		var direction: int
		if relative_position < 0:
			direction = -1
		else:
			direction = 1
		velocity.x = direction * speed
		
	move_and_slide()


func take_damage(damage: int) -> void:
	health -= damage
	print("hit")
	
	# Knock the alien backwards
	if player: 
		var knockback_direction = sign(global_position.x - player.global_position.x)
		knockback = knockback_direction * 600
	
	if health <= 0:
		if gem_scene:
			var gem = gem_scene.instantiate()
			get_parent().add_child(gem)
			gem.global_position = global_position
			print("Gem spawned at: ", gem.global_position)
			print("GEM CREATED")
			print(gem)
			print(gem.global_position)
		queue_free()
		
		

		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("bullet"):
		take_damage(1)
		

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		Global.health -= 5
		
