extends Node2D

var score = 0

@onready var score_label = $Label
@onready var health_label = $Label2
@onready var alien = $alien

func _ready() -> void:
	update_score()
	update_alien_health()
	
	
func _process(delta:float) -> void:
	update_alien_health()
	
func add_score() -> void:
	score += 1
	update_score()
	
func update_score() -> void:
	score_label.text = "Gem Count:" + str(score)
	
func update_alien_health() -> void:
	if is_instance_valid(alien):
		health_label.text = "Alien Health" + str(alien.health)
	else:
		health_label.text = "Alien Health: 0"
	
