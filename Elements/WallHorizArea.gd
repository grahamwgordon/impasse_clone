extends Area2D

var num_stat_areas = 0

signal hide_sprite(hide_bool)

onready var wall = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("hide_sprite", wall, "_on_hide_sprite")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_WallStationaryArea_area_entered(area):
	if area.is_in_group("stationary_areas"):
		num_stat_areas += 1
		#print(num_stat_areas)
		if num_stat_areas > 0:
			#print("signaling to hide")
			emit_signal("hide_sprite", true)


func _on_WallStationaryArea_area_exited(area):
	if area.is_in_group("stationary_areas"):
		num_stat_areas -= 1
		if num_stat_areas == 0:
			emit_signal("hide_sprite", false)
