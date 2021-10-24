extends Node2D

onready var hiddenSprite = $HiddenSprite


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_hide_sprite(hide_bool):
	hiddenSprite.visible = hide_bool
