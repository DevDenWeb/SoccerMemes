extends CharacterBody2D

var speed: float = 300
var jump_force: float = -500
var gravity: float = 980
var push_force = 300

func _physics_process(delta):
	var horizontal_input = Input.get_axis("left_p2", "right_p2")
	velocity.x = horizontal_input * speed
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump_p2") and is_on_floor():
		velocity.y = jump_force
	
	move_and_slide()
	
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider().name == "Ball":
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
