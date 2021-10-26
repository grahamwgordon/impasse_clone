extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var level = get_parent().get_parent()

signal buttonPressed


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("buttonPressed", level, "_on_button_pressed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("player_areas"):
		emit_signal("buttonPressed")
		queue_free()
