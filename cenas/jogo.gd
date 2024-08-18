extends Node2D

@onready var tilemap = $TileMap

@onready var passos: int = 0
@onready var plata_al: int = 0

@onready var tagpassos = "Ui/conatapassos"

@onready var PlatasTotal = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_jogador_andou():
	passos += 1
	get_node(tagpassos).text = "passos: " + str(passos) + "\nplantas alimentadas:" + str(plata_al)
	


func _on_jogador_alimenta(planta):
	pass

