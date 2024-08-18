extends CharacterBody2D

@onready var animacao = $AnimationPlayer
@onready var tilemap = $"../TileMap"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var posicao_atual: Vector2i = tilemap.local_to_map(global_position)
	
	var esq: Vector2i = Vector2i(
		posicao_atual.x + Vector2i.LEFT.x,
		posicao_atual.y + Vector2i.LEFT.y,
	)
	
	var dir: Vector2i = Vector2i(
		posicao_atual.x + Vector2i.RIGHT.x,
		posicao_atual.y + Vector2i.RIGHT.y,
	)

	
	var tile_data: TileData = tilemap.get_cell_tile_data(0, esq)
	
	prints(esq, tilemap.get_cell_tile_data(0, esq).get_custom_data("n_anda"))
	prints(dir, tilemap.get_cell_tile_data(0, dir).get_custom_data("n_anda"))
	print("\n")
	
	if tilemap.get_cell_source_id(1, esq) != -1:
		animacao.play("idle_d")
		print("direita")
		
	elif tilemap.get_cell_source_id(1, dir) != -1:
		animacao.play("idle_e")
		print("esquerda")
		
	else:
		if randi_range(0,1) == 1:
			animacao.play("idle_e")
		else:
			animacao.play("idle_d")
