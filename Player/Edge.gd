extends Area2D



var num_verti_obstacles = 0
var verti_blocked = false

var num_horiz_obstacles = 0
var horiz_blocked = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_Edge_area_entered(area):
	if area.is_in_group("verti_mobile_areas"):
		num_verti_obstacles += 1
	if area.is_in_group("horiz_mobile_areas"):
		num_horiz_obstacles += 1
	verti_blocked = (num_verti_obstacles > 0)
	horiz_blocked = (num_horiz_obstacles > 0)



func _on_Edge_area_exited(area):
	if area.is_in_group("verti_mobile_areas"):
		num_verti_obstacles -= 1
	if area.is_in_group("horiz_mobile_areas"):
		num_horiz_obstacles -= 1
	verti_blocked = (num_verti_obstacles > 0)
	horiz_blocked = (num_horiz_obstacles > 0)
