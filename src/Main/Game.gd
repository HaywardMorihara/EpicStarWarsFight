extends Node
# This class contains controls that should always be accessible, like pausing
# the game or toggling the window full-screen.


# The "_" prefix is a convention to indicate that variables are private,
# that is to say, another node or script should not access them.
onready var _pause_menu = $InterfaceLayer/PauseMenu


func _init():
	OS.min_window_size = OS.window_size
	OS.max_window_size = OS.get_screen_size()


func _notification(what):
	if what == NOTIFICATION_WM_QUIT_REQUEST:
		pass
		# We need to clean up a little bit first to avoid Viewport errors.
#		if name == "Splitscreen":
#			$Black/SplitContainer/ViewportContainer1.free()
#			$Black.queue_free()
	if what == NOTIFICATION_PARENTED:
		# Have to wait until the child is instanced before setting this
		var width = $Level/Bounds/CollisionShape2D.shape.extents.x
		var x = $Level/Bounds.get_position().x
		$Level/Camera2D.limit_left = x - width
		$Level/Camera2D.limit_right = x + width


func _process(delta):
	var p1pos = $Level/Player.position
	var p2pos = $Level/Player2.position
	var diff = p2pos - p1pos
	var midvec = diff * Vector2(0.5, 0.5)
	var midpoint = p1pos + midvec
	$Level/Camera2D.position = midpoint


func _unhandled_input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen
		get_tree().set_input_as_handled()
	# The GlobalControls node, in the Stage scene, is set to process even
	# when the game is paused, so this code keeps running.
	# To see that, select GlobalControls, and scroll down to the Pause category
	# in the inspector.
	elif event.is_action_pressed("toggle_pause"):
		var tree = get_tree()
		tree.paused = not tree.paused
		if tree.paused:
			_pause_menu.open()
		else:
			_pause_menu.close()
		get_tree().set_input_as_handled()

	elif event.is_action_pressed("splitscreen"):
		pass
#		if name == "Splitscreen":
#			# We need to clean up a little bit first to avoid Viewport errors.
#			$Black/SplitContainer/ViewportContainer1.free()
#			$Black.queue_free()
#			# warning-ignore:return_value_discarded
#			get_tree().change_scene("res://src/Main/Game.tscn")
#		else:
#			# warning-ignore:return_value_discarded
#			get_tree().change_scene("res://src/Main/Splitscreen.tscn")
