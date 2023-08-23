extends Control


func _ready():
	$AudioStreamPlayer2D.play()
	get_tree().paused = false


func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://level.tscn")


func _on_fullscreen_pressed():
	$AudioStreamPlayer2D.play()
	if DisplayServer.window_get_mode() == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		return
	
	if DisplayServer.window_get_mode() == 3:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		return


func _on_exit_pressed():
	get_tree().quit()


func _on_controles_pressed():
	get_tree().change_scene_to_file("res://Controles.tscn")
