extends Node2D

export(String) var level_name

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("ui_reset"):
		get_tree().reload_current_scene()
	elif event.is_action_pressed("ui_next"):
		_on_win()
	elif event.is_action_pressed("ui_prev"):
		get_tree().change_scene("res://Levels/Level" + str(int(get_tree().current_scene.filename)-1) + ".tscn")

func _on_Player_vertical_movement():
	get_tree().call_group("verti_mobiles", "move")

func _on_Player_horizontal_movement():
	get_tree().call_group("horiz_mobiles", "move")

func _on_button_pressed():
	get_tree().call_group("locks", "change_state")

func _on_win():
	get_tree().change_scene("res://Levels/Level" + str(int(get_tree().current_scene.filename)+1) + ".tscn")
