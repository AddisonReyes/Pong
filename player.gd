extends CharacterBody2D

var speed = 660
var invertedControls = false
var fixedx


func _ready():
	fixedx = position.x


func _physics_process(delta):
	if invertedControls:
		var direction = Input.get_axis("ui_down", "ui_up")
		velocity.y = direction * speed
		position.x = fixedx
		
		move_and_slide()
		
	else:
		var direction = Input.get_axis("ui_up", "ui_down")
		velocity.y = direction * speed
		position.x = fixedx
		
		move_and_slide()
