extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_fase_1_pressed():
	get_tree().change_scene_to_file("res://cenas/fases/fase_1.tscn")


func _on_fase_2_pressed():
	get_tree().change_scene_to_file("res://cenas/fases/fase_2.tscn")


func _on_fase_3_pressed():
	get_tree().change_scene_to_file("res://cenas/fases/fase_3.tscn")


func _on_fase_4_pressed():
	get_tree().change_scene_to_file("res://cenas/fases/fase_4.tscn")


func _on_casinha_pressed():
	get_tree().change_scene_to_file("res://inicio.tscn")
