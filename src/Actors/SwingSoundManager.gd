extends Node2D

var last_played := 1

func play():
	if last_played == 2:
		$Swing01.play()
		last_played = 1
	elif last_played == 1:
		$Swing02.play()
		last_played = 2
