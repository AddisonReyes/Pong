extends CharacterBody2D
class_name Fake_Ball


var direction = Vector2.ZERO
var speedMultiplier = 1.16
var is_moving = false
var speed = 0


func _ready():
	randomize()
	reset_ball()


func reset_ball():
	speed = 630
	direction.x = [-1, 1][randi() % 2]
	direction.y = [-0.8, 0.8][randi() % 2]
	is_moving = true


func _physics_process(delta):
	if is_moving:
		var collide = move_and_collide(speed * direction * delta);
		
		if collide:
			direction = direction.bounce(collide.get_normal())
			speed += speedMultiplier


func _on_restart_timer_timeout():
	reset_ball()
