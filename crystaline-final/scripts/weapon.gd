extends Area2D

var speed: float = 1300.0
var player: CharacterBody2D
var damage: int = 1


@onready var marker_2d: Marker2D = $Marker2D


const BULLET = preload("res://scenes/bullet.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		print("SHOOTING")
		shoot()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("alien"):
		body.take_damage(damage)
		queue_free()

func shoot() -> void:
	var new_bullet = BULLET.instantiate()
	
	new_bullet.global_position = marker_2d.global_position
	
	new_bullet.target_position = (get_global_mouse_position() - marker_2d.global_position).normalized()
	
	get_tree().current_scene.add_child(new_bullet)
