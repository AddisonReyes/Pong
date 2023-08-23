extends Node2D


var rng = RandomNumberGenerator.new()

var fakeBallPath = preload("res://fakeBall.tscn")
var fakeBall = fakeBallPath.instantiate()

var points = 1
var PlayerScore = 0
var ComputerScore = 0
var eraseFakeBalls = true


func _ready():
	$AudioStreamPlayer2D.play()
	$Label.text = "Cando se marque 1 punto aqui se mostrara el modificador que tendra la siguiente partida, es completamente aleatorio!!"
	_restart_game()


func _process(delta):
	$"Marcador Izq".text = str(ComputerScore)
	$"Marcador Der".text = str(PlayerScore)


func _physics_process(delta):
	if Input.is_physical_key_pressed(KEY_ESCAPE):
		get_tree().paused = true


func _restart_game():
	$Ball.direction = Vector2.ZERO
	$Ball.is_moving = false
	$Ball.speed = 0
	
	$Player.speed = 660
	$Opponent.speed = 660
	$Ball.speedMultiplier = 1.16
	
	$Ball.position = Vector2(960, 540)
	$RestartTimer.start()


func random_modifier():
	var num = rng.randi_range(0, 6)
	
	$Player.invertedControls = false
	$Ball.changeScale = false
	$Ball.miniBall = false
	eraseFakeBalls = true
	points = 1
	
	if num == 0:
		$Label.text = "No ha pasado nada! Es una pena la verdad."
	
	if num == 1:
		$Label.text = "EL JUEGO VA MAS RAPIDO!!!!! Tu velocidad de movimiento y la velocidad de la pelota han aumentado considerablemente."
		
		$Player.speed += 660
		$Opponent.speed += 660
		$Ball.speed += 660
		
		$Ball.speedMultiplier = 16.66
	
	if num == 2:
		$Label.text = "Pelotas falsas!! Cual sera la verdadera??"
		eraseFakeBalls = false
		
		var fakeBalls = rng.randi_range(2, 6)
		var y = 460
		
		for i in range(fakeBalls):
			var newBall = fakeBall.duplicate()
			newBall.position = Vector2(920, y)
			add_child(newBall)
			y += 5
		
		$Ball.reset_ball()
	
	if num == 3:
		$Label.text = "La pelota cambia de escala cada vez que choca."
		$Ball.changeScale = true
	
	if num == 4:
		$Label.text = "Tus botones estan invertidos!!! Seria una pena si pierdes un punto por eso!!"
		$Player.invertedControls = true
	
	if num == 5:
		$Label.text = "La pelota se hara muy chiquita!!!!!!! Espero que la veas bien!"
		$Ball.miniBall = true
	
	if num == 6:
		points = rng.randi_range(2, 4)
		$Label.text = "El siguiente que marque un punto ganara un total de " + str(points) + " puntos."


func _on_arco_oponente_body_entered(body):
	if body is Ball:
		PlayerScore += points
		_restart_game()
		random_modifier()


func _on_arco_player_body_entered(body):
	if body is Ball:
		ComputerScore += points
		_restart_game()
		random_modifier()


func _on_area_2d_body_entered(body):
	if body is Fake_Ball and eraseFakeBalls:
		body.queue_free()
