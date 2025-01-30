extends CharacterBody2D

#------------- версия Chat GPT -----------------

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0


#func _physics_process(delta):
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	#if Input.is_action_just_pressed("ui_up") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#var collision = move_and_collide(velocity * delta)
	#if collision:
		#var collider = collision.get_collider()
		#if collider.is_in_group("ball"):
			#var impact_force = max(velocity.length(), 300.0)
			#var dir_ball = (collider.global_position - global_position).normalized()
			#
			#dir_ball.y -= 2.0
			#collider.apply_custom_impulse(dir_ball.normalized() * impact_force)
#
	#move_and_slide()

# ------------- Версия deepseek -----------------

var speed: float = 300
var jump_force: float = -500
var gravity: float = 980
var push_force = 300

func _physics_process(delta):
	var horizontal_input = Input.get_axis("ui_left", "ui_right")
	velocity.x = horizontal_input * speed
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_force
	
	move_and_slide()
	
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider().name == "Ball":
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
