extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("cima")):
		move(Vector2.UP)
	elif(Input.is_action_pressed("baixo")):
		move(Vector2.DOWN)
	elif(Input.is_action_pressed("esquerda")):
		move(Vector2.LEFT)
	elif(Input.is_action_pressed("direita")):
		move(Vector2.RIGHT)
		
		
func move(direction: Vector2):
	#print(direction)
