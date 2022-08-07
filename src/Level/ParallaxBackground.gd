extends ParallaxBackground


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$LavaPlumeManager.limit_left = -2048
	$LavaPlumeManager.limit_right = 1024


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
