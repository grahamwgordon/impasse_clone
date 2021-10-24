extends Node2D

export(String) var level_name

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("ui_reset"):
		get_tree().reload_current_scene()

func _on_Player_vertical_movement():
	get_tree().call_group("mobiles", "move")

func _on_win():
	get_tree().change_scene("res://Levels/Level" + str(1+int(get_tree().current_scene.filename)) + ".tscn")
