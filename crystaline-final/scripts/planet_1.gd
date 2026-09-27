extends Node2D

#constants used for changing the score the scrore and displaying alien health
const SCORE_INCREASE = 1
const ALIEN_HEALTH_TEXT = "Alien Health: "
const NO_HEALTH = 0

var score = 0

@onready var score_label = $Label
@onready var health_label = $Label2
@onready var alien = $alien

func _ready() -> void:
	#set the starting scorr and alien health on the screen
	update_score()
	update_alien_health()


func _process(delta:float) -> void:
	#keep the displayed alien health updated while the game is running
	update_alien_health()


func add_score() -> void:
	#increase the gem count when the aastronaut collects a gem
	score += SCORE_INCREASE
	update_score()


func update_score() -> void:
	#display the current number of collected gems
	score_label.text = "Gem Count:" + str(score)


func update_alien_health() -> void:
	#display the alien's current health, or zero if the alien no longer exists
	if is_instance_valid(alien):
		health_label.text = ALIEN_HEALTH_TEXT + str(alien.health)
	else:
		health_label.text = ALIEN_HEALTH_TEXT + str(NO_HEALTH)
	
