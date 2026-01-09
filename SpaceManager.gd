extends Node

func changeTimeScale(time):
	TimeProvider.timeScale = time

func multiplyTimeScale():
	TimeProvider.timeScale = TimeProvider.timeScale * 2
	
func resetScene():
	changeTimeScale(0)
	get_tree().change_scene_to_file("res://space.tscn")
	
