extends Area2D



var num_stat_obstacles = 0
var stat_blocked = false

var num_mobi_obstacles = 0
var mobi_blocked = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_Edge_area_entered(area):
	if area.is_in_group("stationary_areas"):
		num_stat_obstacles += 1
	if area.is_in_group("mobile_areas"):
		num_mobi_obstacles += 1
	stat_blocked = (num_stat_obstacles > 0)
	mobi_blocked = (num_mobi_obstacles > 0)



func _on_Edge_area_exited(area):
	if area.is_in_group("stationary_areas"):
		num_stat_obstacles -= 1
	if area.is_in_group("mobile_areas"):
		num_mobi_obstacles -= 1
	stat_blocked = (num_stat_obstacles > 0)
	mobi_blocked = (num_mobi_obstacles > 0)
