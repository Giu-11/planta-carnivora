extends Node2D

signal prox_fase


func _on_sele_pressed():
	get_tree().change_scene_to_file("res://cenas/seleção_de_fases.tscn")


func _on_prox_pressed():
	prox_fase.emit()
