extends Node2D


onready var level = get_parent()
onready var label = $Label


# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = level.level_name


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
