extends Node2D

onready var sprite = $Sprite
onready var sprite2 = $Sprite2
onready var hiddenSprite = $HiddenSprite
onready var horizCollision = $HorizArea/CollisionShape2D
onready var vertiCollision = $VertiArea/CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.visible = true
	sprite2.visible = true
	hiddenSprite.visible = false
	horizCollision.disabled = false
	vertiCollision.disabled = true

func move():
	sprite.visible = not sprite.visible
	sprite2.visible = not sprite2.visible
	hiddenSprite.visible = not hiddenSprite.visible
	vertiCollision.disabled = not vertiCollision.disabled
	horizCollision.disabled = not horizCollision.disabled
