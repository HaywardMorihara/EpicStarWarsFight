extends Node2D


func restart():
	$LavaPlumeYellow.restart()
	$LavaPlumeOrange.restart()
	$LavaPlumeRed.restart()


func _on_Timer_timeout():
	restart()
	$DemoTimer.start()
