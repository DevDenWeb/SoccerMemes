extends CanvasLayer

func _ready():
	# Связываем сигналы кнопок с функиями
	$MarginContainer/VBoxContainer/Play.pressed.connect(_on_play_pressed)
	$MarginContainer/VBoxContainer/Settings.pressed.connect(_on_settings_pressed)
	$MarginContainer/VBoxContainer/Exit.pressed.connect(_on_exit_pressed)
	
	# Автоматически кнопки подстраиваются под размер крана
	var viewport_size = get_viewport().get_visible_rect().size
	$MarginContainer.set("custom_constants/margin_left", viewport_size.x * 0.1)
	$MarginContainer.set("custom_constants/margin_right", viewport_size.x * 0.1)
	$MarginContainer.set("custom_constants/margin_top", viewport_size.x * 0.1)
	$MarginContainer.set("custom_constants/margin_bottom", viewport_size.x * 0.1)

func _on_play_pressed():
	# Загружаем игровую сцену
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_settings_pressed():
	pass
	# Показываем меню настроек
	#var settings = preload("Scenes/SettingsMenu.tscn")
	#add_child(settings)

func _on_exit_pressed():
	get_tree().quit()
	#JavaScript.eval("YandexGames.exit();", true)
