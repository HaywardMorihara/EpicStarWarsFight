extends Node2D

func _ready():
	var width = $Bounds/CollisionShape2D.shape.extents.x
	var x = $Bounds.get_position().x
	for child in get_children():
		if child is Player:
			var camera = child.get_node("Camera")
			camera.limit_left = x - width
			camera.limit_right = x + width
#			camera.limit_top = LIMIT_TOP
#			camera.limit_bottom = LIMIT_BOTTOM
		if child.is_in_group("lava_plume_managers"):
			child.limit_left = x - width
			child.limit_right = x + width
