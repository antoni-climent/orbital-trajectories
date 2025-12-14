extends Node2D
class_name PhysicsObject

@export var mass:float
var positionMeters:Vector2

func _init():
	add_to_group("physics_objects")
	
func _ready():
	positionMeters = CoordinateConverter.PixelsToMeters(self.position)
	print(self.name, positionMeters)
