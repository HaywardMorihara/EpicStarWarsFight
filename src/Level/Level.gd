extends Node2D

func _ready():
	var width = $Bounds/CollisionShape2D.shape.extents.x
	var x = $Bounds.get_position().x
	for child in get_children():
		if child.is_in_group("lava_plume_managers"):
			child.limit_left = x - width
			child.limit_right = x + width
