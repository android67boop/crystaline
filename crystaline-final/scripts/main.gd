extends Node2D

# Stores the scene paths used by the menu buttons
const MAIN_SCENE = "res://scenes/main.tscn"
const PLANET_SCENE = "res://scenes/planet1.tscn"
const OPTIONS_SCENE = "res://scenes/options.tscn"

# Starts the game
func _play() -> void:
	get_tree().call_deferred("change_scene_to_astronaut", MAIN_SCENE)

# Closes the game	
func _quit() -> void:
	get_tree().quit()

# Opens the planet scene
func _on_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", PLANET_SCENE)

# Opens the options menu
func _on_button_3_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", OPTIONS_SCENE)
	
	
	
	
