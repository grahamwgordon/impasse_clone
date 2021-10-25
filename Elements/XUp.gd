extends Node2D


const TILE_SIZE = 16
const PUZZLE_HEIGHT = 3
const PUZZLE_WIDTH = 10
const WORLD_HEIGHT = 5
const WORLD_WIDTH = 10

var MARGIN = (WORLD_HEIGHT - PUZZLE_HEIGHT)/2



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func move():
	position.y -= TILE_SIZE
	position.y = TILE_SIZE*(MARGIN + int(position.y/TILE_SIZE + PUZZLE_HEIGHT - 1)%PUZZLE_HEIGHT)
