extends CharacterBody2D


var movement_speed = 50.0

func _physics_process(delta):
	movement()

func movement():
	var x_movement = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	var y_movement = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	var mov = Vector2(x_movement, y_movement)
	velocity = mov.normalized() * movement_speed
	move_and_slide()