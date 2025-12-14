extends Node

@export var metersPerPixel = 10000.0

func PixelsToMeters(pixelCoordinates:Vector2):
	return pixelCoordinates * metersPerPixel

func MetersToPixels(meterCoordinates:Vector2):
	return meterCoordinates / metersPerPixel
