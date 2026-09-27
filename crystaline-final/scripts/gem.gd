extends Area2D

func _on_body_entered(body: Node2D) -> void:
	#check that the astronaut collected the gem before adding to the score
	if body.is_in_group("astronaut"):
		get_tree().current_scene.add_score()
		queue_free()
