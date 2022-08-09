extends Node2D

var limit_left : float
var limit_right : float

var lava_plumes : Array
var next_lava_plume_index := 0

func _ready():
	for child in get_children():
		if child.is_in_group("lava_plumes"):
			lava_plumes.append(child)

func _on_Timer_timeout():
	var lava_plume = lava_plumes[next_lava_plume_index]
	
	if next_lava_plume_index == len(lava_plumes) - 1:
		next_lava_plume_index = 0
	else:
		next_lava_plume_index += 1
	
	var randx = rand_range(limit_left, limit_right)
	var scale = rand_range(0.5, 2.0)
	lava_plume.scale = Vector2(scale, scale)
	lava_plume.position = Vector2(randx, lava_plume.position.y)
	lava_plume.restart()
