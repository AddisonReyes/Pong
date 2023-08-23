extends CharacterBody2D
class_name Ball


var rng = RandomNumberGenerator.new()

var direction = Vector2.ZERO
var speedMultiplier = 1.16
var changeScale = false
var miniBall = false
var is_moving = false
var speed = 0
var timer


func _ready():
	timer = get_parent().find_child("RestartTimer")
	changeScale = false
	
	randomize()
	reset_ball()


func change_scale():
	var newScale = rng.randf_range(0.6, 3)
	self.scale = Vector2(newScale, newScale)


func reset_ball():
	timer.stop()
	
	speed = 630
	direction.x = [-1, 1][randi() % 2]
	direction.y = [-0.8, 0.8][randi() % 2]
	is_moving = true
	

func _physics_process(delta):
	if is_moving:
		var collide = move_and_collide(speed * direction * delta);
		
		if collide:
			if changeScale:
				change_scale()
			
			elif miniBall:
				self.scale = Vector2(0.1, 0.1)
				
			else:
				self.scale = Vector2(1, 1)
				
			direction = direction.bounce(collide.get_normal())
			$AudioCollision.play()
			
			speed += speedMultiplier


func _on_restart_timer_timeout():
	reset_ball() # Replace with function body.
