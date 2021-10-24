extends Area2D


onready var level = get_parent().get_parent()

signal win


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("win", level, "_on_win")





func _on_Goal_area_entered(area):
	if area.is_in_group("players"):
		emit_signal("win")
