extends Control


func _ready():
	pass


func _process(delta):
	if get_tree().paused:
		self.show()
	else:
		self.hide()
		
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = false


func _on_resume_pressed():
	$AudioStreamPlayer2D.play()
	get_tree().paused = false


func _on_fullscreen_pressed():
	$AudioStreamPlayer2D.play()
	if DisplayServer.window_get_mode() == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		return
	
	if DisplayServer.window_get_mode() == 3:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		return


func _on_menu_pressed():
	$AudioStreamPlayer2D.play()
	get_tree().change_scene_to_file("res://Menu.tscn")
