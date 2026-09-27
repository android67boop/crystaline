extends Area2D

const GUN_DAMAGE = 1
const BULLET_SCENE = preload("res://scenes/bullet.tscn")

var speed: float = 1300.0
var player: CharacterBody2D
var damage: int = GUN_DAMAGE

@onready var marker_2d: Marker2D = $Marker2D

func _process(delta: float) -> void:
	#make the gun point towards the mouse
	look_at(get_global_mouse_position())
	#shoot when the shoot button is pressed
	if Input.is_action_just_pressed("shoot"):
		shoot()


func shoot() -> void:
	#create a new bullet
	var new_bullet = BULLET_SCENE.instantiate()
	#start the bulllet at the end of the gun
	new_bullet.global_position = marker_2d.global_position
	#make the bullet travel towards the mouse
	new_bullet.target_position = (get_global_mouse_position() - marker_2d.global_position).normalized()
	get_tree().current_scene.add_child(new_bullet)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("alien"):
		body.take_damage(damage)
		queue_free()
