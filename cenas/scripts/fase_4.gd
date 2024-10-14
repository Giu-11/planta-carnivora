extends Node2D

@onready var tagpassos = "Ui/VBoxContainer/HBoxContainer/timer"
@onready var tagplantas = "Ui/VBoxContainer/HBoxContainer4/plantascomeram"
@onready var tagtotalplantas = "Ui/VBoxContainer/HBoxContainer3/totalplatas"
@onready var tagcomcomida = "Ui/VBoxContainer/HBoxContainer2/comcomida"
@onready var telaFim = "Ui/fimFase"
@onready var tilemap = self.get_parent().get_node("TileMap")
@onready var passos: int = 0
@onready var plata_al: int = 0

const total_plantas = 2

signal comeu(onde)
signal acabou

# Called when the node enters the scene tree for the first time.
func _ready():
	if not $Ui.visible:
		$Ui.show()
	get_node(tagtotalplantas).text = "Total de plantas: " + str(total_plantas)
	pass


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
			acabou.emit()
			$Timer.stop()
			get_node(telaFim + "/Label").text = "Você Ganhou :]!!!"
			get_node(telaFim + "/HBoxContainer/prox").hide()
			get_node(telaFim).show()


func _on_timer_timeout():
	print("perdeu mano")
	acabou.emit()
	get_node(telaFim + "/Label").text = "Você Perdeu :["
	get_node(telaFim + "/HBoxContainer/prox").hide()
	get_node(telaFim).show()


func _on_jogador_pegoucomida():
	get_node(tagcomcomida).text = "Com comida"
