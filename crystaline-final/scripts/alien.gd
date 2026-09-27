extends CharacterBody2D

const KNOCKBACK_STRENGTH = 600
const RESPAWN_TIME = 2
const STOP_KNOCKBACK = 0
const KNOCKBACK_SLOWDOWN = 40
const MAX_HEALTH = 5
const BULLET_DAMAGE = 1

var health = MAX_HEALTH
var knockback = 0.0
var spawn_position: Vector2

@export var speed: float = 200.0
@export var player: Node2D
@export var gem_scene: PackedScene

#store the alien's starting position so it can return there after respawning
func _ready() -> void:
	spawn_position = global_position


#move the alien using knockback or make it follow the astronaut
func _physics_process(delta: float) -> void:
	if knockback != 0:
		#apply knockback and gradually reduce it until the alien stops
		velocity.x = knockback
		knockback = move_toward(knockback, STOP_KNOCKBACK, KNOCKBACK_SLOWDOWN)
	
	elif player:
		#work out whether the astronaut is to the left or right of the alien
		var relative_position = (player.global_position.x - global_position.x)
		var direction: int
		if relative_position < 0:
			direction = -1
		else:
			direction = 1
	
		#move the alien towards the astronaut
		velocity.x = direction * speed
	move_and_slide()


#reduce the alien's heealth and handle knockback and respawning when it is hit
func take_damage(damage: int) -> void:
	#ignore damage while the alien is hidden during its respawn timer
	if not visible:
		return

	health -= damage
	print("hit")
	
	#push the alien away from the astronaut when it is hit
	if player: 
		var knockback_direction = sign(global_position.x - player.global_position.x)
		knockback = knockback_direction * KNOCKBACK_STRENGTH
	#when the alien runs out of health, create a gem and start the respawn process
	if health <= 0:
		if gem_scene:
			var gem = gem_scene.instantiate()
			get_parent().add_child(gem)
			gem.global_position = global_position
		hide()
		set_physics_process(false)

		#wait 2s before bringing the alien back into the game
		await get_tree().create_timer(RESPAWN_TIME).timeout

		#reset the alien's health and position and movement before respawning it
		health = MAX_HEALTH
		knockback = 0.0
		global_position = spawn_position
		show()
		set_physics_process(true)



#damage the alien when a bullet enters its hit area
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("bullet"):
		take_damage(BULLET_DAMAGE)
		

		
