extends CharacterBody2D

var speed = 660
var fixedx
var ball


func _ready():
	ball = get_parent().find_child("Ball")
	fixedx = position.x


func _physics_process(delta):
	if ball.position.x < 960 and ball.position.x > position.x:
		var direction = Vector2(0, _get_direction())
		velocity = direction * speed
		position.x = fixedx
		
		move_and_slide()


func _get_direction():
	if abs(ball.position.y - position.y) > 6:
		if ball.position.y > position.y:
			return 1
			
		else:
			return -1
		
	else:
		return 0
