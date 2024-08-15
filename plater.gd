extends Node2D

@onready var tile_map = $"../TileMap"

var movendo = false

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
	if movendo:
		return
		
	var current: Vector2i = tile_map.local_to_map(global_position)
	
	var target: Vector2i = Vector2i(
		current.x + direction.x,
		current.y + direction.y
	)
	prints(current, target)
	
	var dados: TileData = tile_map.get_cell_tile_data(0, target)
	
	if (not(dados.get_custom_data("anda"))):
		return
	
	global_position = tile_map.map_to_local(target)
