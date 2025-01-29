extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.is_in_group("ball"):
			var impact_force = max(velocity.length(), 200.0)
			var dir_ball = (collider.global_position - global_position).normalized()
			
			dir_ball.y -= 1.5
			collider.apply_custom_impulse(dir_ball.normalized() * impact_force)

	move_and_slide()
