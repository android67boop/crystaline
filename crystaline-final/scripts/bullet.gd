extends Area2D

@export var speed : int = 800
var target_position: Vector2 = Vector2.ZERO
var despawn_time := 5.0
var damage: int = 1

func _ready() -> void: 
	body_entered.connect(_on_body_entered)
	despawn()


func _physics_process(delta: float) -> void:
	global_position += target_position * speed * delta
	
func _on_body_entered(body: Node2D) -> void:
	print("COLLISION WITH: ", body.name)
	print("IS ALIEN: ", body.is_in_group("alien"))
	if body.is_in_group("alien"):
		print("im in alien")
		body.take_damage(damage)
		queue_free()
		


func despawn() -> void:
	await get_tree().create_timer(despawn_time).timeout
	
	queue_free()
