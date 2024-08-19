extends Node2D

@onready var tilemap = $TileMap

@onready var passos: int = 0
@onready var plata_al: int = 0

@onready var tagpassos = "Ui/conatapassos"
@onready var tagplantas = "Ui/plantascomeram"

@onready var PlatasTotal = 2

signal comeu(onde)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_jogador_andou():
	passos += 1
	get_node(tagpassos).text = "passos: " + str(passos)
	


func _on_jogador_alimenta(planta, onde):
	if not get_node(planta.get_path()).get("comeu"):
		print("n comi")

		var p = load(str(planta.get_path()))
		var nome = planta.name
		
		print(nome)
		print(get_node(NodePath(str(nome))))
		#"\nplantas alimentadas:" + str(plata_al)
		#planta.comeu
		#get_node(NodePath(str(nome))).connect("comeu", get_node(NodePath(str(nome))).comi)
		#get_node(planta).get("comeu") = true
		comeu.emit(onde)
		plata_al+=1
		print("miau\n")
		get_node(tagplantas).text = "plantas alimentadas:" + str(plata_al)
		
