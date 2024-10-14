extends CanvasLayer

signal prox_fase

func _on_casinha_pressed():
	get_tree().change_scene_to_file("res://cenas/inicio.tscn")


func _on_fim_fase_prox_fase():
	prox_fase.emit()
