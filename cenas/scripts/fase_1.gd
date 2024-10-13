extends Node2D

@onready var tagpassos = "Ui/timer"
@onready var tagplantas = "Ui/plantascomeram"
@onready var tagtotalplantas = "Ui/totalplatas"
@onready var tagcomcomida = "Ui/comcomida"
@onready var tilemap = self.get_parent().get_node("TileMap")
@onready var passos: int = 0
@onready var plata_al: int = 0

const total_plantas = 1

signal comeu(onde)

# Called when the node enters the scene tree for the first time.
func _ready():
	if not $Ui.visible:
		$Ui.show()
	get_node(tagtotalplantas).text = "Total de plantas: " + str(total_plantas)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node(tagpassos).text = "%s" % roundf($Timer.time_left)
	pass


func _on_jogador_alimenta(planta, onde):
	if not get_node(planta.get_path()).get("comeu"):
		print("n comi")

		var p = load(str(planta.get_path()))
		var nome = planta.name
		
		print(nome)
		print(get_node(NodePath(str(nome))))
		comeu.emit(onde)
		plata_al+=1
		print("miau\n")
		get_node(tagplantas).text = "plantas alimentadas:" + str(plata_al)
		
		if plata_al == total_plantas:
			print("ganhou mano :)")
			#aqui vc coloca a tela de ganhou


func _on_timer_timeout():
	print("perdeu mano")
	pass # Replace with function body.


func _on_jogador_pegoucomida():
	get_node(tagcomcomida).text = "Com comida"
