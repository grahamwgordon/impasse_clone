extends Node2D

onready var level = get_parent()

const TILE_SIZE = 16
const PUZZLE_HEIGHT = 3
const PUZZLE_WIDTH = 10
const WORLD_HEIGHT = 5
const WORLD_WIDTH = 10

var MARGIN = (WORLD_HEIGHT - PUZZLE_HEIGHT)/2

onready var right = $Edges/Right
onready var left = $Edges/Left
onready var bottom = $Edges/Bottom
onready var bottom2 = $Edges/Bottom2
onready var top = $Edges/Top
onready var top2 = $Edges/Top2

signal vertical_movement
signal horizontal_movement

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("vertical_movement", level, "_on_Player_vertical_movement")
	self.connect("horizontal_movement", level, "_on_Player_horizontal_movement")


func _input(event):
	if event.is_action_pressed("ui_right") or event.is_action_pressed("ui_left"):
		# horizontal movement
		# board is stationary
		if event.is_action_pressed("ui_right"):
			if not right.horiz_blocked:
				position.x += TILE_SIZE
				emit_signal("horizontal_movement")
		else:
			if not left.horiz_blocked:
				position.x -= TILE_SIZE
				emit_signal("horizontal_movement")
	elif event.is_action_pressed("ui_up") or event.is_action_pressed("ui_down"):
		# vertical movement
		# board is mobile
		if event.is_action_pressed("ui_up"):
			if not top.verti_blocked and not top2.verti_blocked:
				emit_signal("vertical_movement")
				position.y -= TILE_SIZE
		else:
			if not bottom.verti_blocked and not bottom2.verti_blocked:
				position.y += TILE_SIZE
				emit_signal("vertical_movement")
	position.x = max(0, min(position.x, TILE_SIZE*(PUZZLE_WIDTH-1)))
	#position.y = max(TILE_SIZE*MARGIN, min(position.y, TILE_SIZE*(WORLD_HEIGHT - MARGIN - 1)))
	position.y = TILE_SIZE*(MARGIN + int(position.y/TILE_SIZE + PUZZLE_HEIGHT - 1)%PUZZLE_HEIGHT)

