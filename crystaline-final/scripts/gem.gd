extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("astronaut"):
		get_tree().current_scene.add_score()
		queue_free()
		
func _ready() -> void:
	print("GEM IS VISIBLE")
