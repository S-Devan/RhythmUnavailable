extends CharacterBody2D


var movement_speed = 50.0
@onready var sprite = get_node("Sprite2D")
@onready var walkTimer = get_node("%WalkTimer")
func _physics_process(_delta):
	movement()

func movement():
	var x_movement = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	var y_movement = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	var mov = Vector2(x_movement, y_movement)

	if mov.x > 0:
		sprite.flip_h = false
	elif mov.x < 0:
		sprite.flip_h = true

	if mov != Vector2.ZERO:
		if walkTimer.is_stopped():
			if sprite.frame >= sprite.hframes - 1:
				sprite.frame = 0
			else:
				sprite.frame += 1
			walkTimer.start()

	velocity = mov.normalized() * movement_speed
	move_and_slide()
