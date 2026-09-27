extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -500.0
const STOP_SPEED = 0
const NO_DIRECTION = 0
const LEFT_DIRECTION = -1
const RIGHT_DIRECTION = 1
const JUMP_ACTION = "ui_up"
const LEFT_ACTION = "ui_left"
const RIGHT_ACTION = "ui_right"
const MOVEMENT_ACTIONS = [LEFT_ACTION, RIGHT_ACTION]


func _physics_process(delta: float) -> void:
	#apply gravity while the astronaut is in the air 
	#this makes the astronaut fall back towards the ground 
	if not is_on_floor():
		velocity += get_gravity() * delta
	#only allow the astronaut to jump when they are on the ground
	if Input.is_action_just_pressed(JUMP_ACTION) and is_on_floor():
		velocity.y = JUMP_VELOCITY
	#start with no horizontal movement
	var direction := NO_DIRECTION 
	#check the movement keys and change directions based on the key pressed
	for action in MOVEMENT_ACTIONS:
		if Input.is_action_pressed(action):
			if action == LEFT_ACTION:
				direction += LEFT_DIRECTION
			else:
				direction += RIGHT_DIRECTION
	#move the astronaut in the chosen direction or slow them down when no key is pressed
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, STOP_SPEED, SPEED)

	move_and_slide()
	
