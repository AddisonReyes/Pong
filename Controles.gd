extends Control


func _ready():
	$AudioStreamPlayer2D.play()


func _process(delta):
	pass


func _on_atras_pressed():
	get_tree().change_scene_to_file("res://Menu.tscn")
