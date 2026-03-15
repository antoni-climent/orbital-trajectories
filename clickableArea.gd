extends Area2D

class_name clickableArea

signal areaClicked

func _input_event(_viewport: Node, event: InputEvent, _shape_idx: int):
	if event.is_pressed() and event is InputEventMouseButton:
		areaClicked.emit()
		print("Area clicked!")
	
