extends CharacterBody2D

@onready var animationtree = $AnimationTree
@onready var tilemap = $"../TileMap"


func _ready():
	update_animation(Vector2(0, 1))

func _physics_process(_delta):
	var posicao_atual: Vector2i = tilemap.local_to_map(global_position)
	
	var direcao = Vector2.ZERO
	if Input.is_action_just_pressed("cima"):
		direcao = Vector2(0,-1)
	elif Input.is_action_just_pressed("baixo"):
		direcao = Vector2(0,1)
	elif Input.is_action_just_pressed("esquerda"):
		direcao = Vector2(-1,0)
	elif Input.is_action_just_pressed("direita"):
		direcao = Vector2(1,0)
		
	var posicao_destino: Vector2i = Vector2i(
		posicao_atual.x + direcao.x,
		posicao_atual.y + direcao.y,
	)
	
	update_animation(direcao)
	
	# confirma se o tile existe (camada 0)
	if tilemap.get_cell_source_id(0, posicao_destino) == -1:
		return
	
	var tile_data: TileData = tilemap.get_cell_tile_data(0, posicao_destino)
	# confirma que o tile é andavel (camada 0)
	if tile_data.get_custom_data("n_anda"):
		return
	
	if tilemap.get_cell_source_id(1, posicao_destino) != -1:
		tile_data = tilemap.get_cell_tile_data(1, posicao_destino)
		if tile_data.get_custom_data("n_anda"):
			return	
	

	global_position = tilemap.map_to_local(posicao_destino)
	

func update_animation(direcao: Vector2):
	if direcao != Vector2.ZERO:
		animationtree.set("parameters/idle/blend_position", direcao)
		
