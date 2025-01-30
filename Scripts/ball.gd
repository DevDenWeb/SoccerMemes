extends RigidBody2D

#func apply_custom_impulse(force: Vector2):
	#linear_velocity += force # Добавляем силу удара к текущей скорости

# --------------------------------------------------------

# Задержка перед сбросом (в сек)
@export var reset_delay: float = 1.0
var reset_timer: float = 0.0

func _physics_process(delta):
	var viewport = get_viewport().get_visible_rect()
	
	# Проверяем выход за границы экрана с небольшим запасом
	if !viewport.has_point(global_position):
		reset_timer += delta
		if reset_timer >= reset_delay:
			reset_ball()
			reset_timer = 0.0
	else :
		reset_timer = 0.0

func reset_ball():
	global_position = get_viewport().get_visible_rect().size / 2
	linear_velocity = Vector2.ZERO
	angular_velocity = 0.0
	# Можно добавить эффекты или звук
	#$AnimationPlayer.play("reset_effect")
	#$AudioStreamPlayer.play()
