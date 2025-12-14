extends PhysicsObject

var _speed:Vector2 = Vector2.ZERO
var _planets:Array[PhysicsObject] = []
var _G:float = 6.6723e-11

func getPlanets():
	_planets.clear()

	for obj in get_tree().get_nodes_in_group("physics_objects"):
		if obj != self:
			_planets.append(obj)

func updateSpeed(delta):
	var acceleration = Vector2.ZERO
	for planet in _planets:
		var distance:Vector2 = planet.positionMeters - self.positionMeters
		#distance = CoordinateConverter.PixelsToMeters(distance)
		
		# if distance.length() > 200000:
		var F = distance.normalized()*_G*planet.mass*self.mass/distance.length()**2
		acceleration += F/self.mass # F = m*a
		var s = _speed + acceleration*delta
		print("distance: ", distance.length(), " acceleration: ", acceleration, " speed: ", s)
	_speed =+ acceleration*delta
	
func updatePosition(delta):
	# var currentPosition = positionMeters #CoordinateConverter.PixelsToMeters(self.position)
	positionMeters += _speed * delta
	self.position = CoordinateConverter.MetersToPixels(positionMeters)
	#print(self.position)
	
func _process(delta: float) -> void:
	updateSpeed(delta)
	updatePosition(delta)

func _ready():
	getPlanets()
	super._ready()
	
#distance: 7197.69091796875acceleration: (2433569536.0, 54079256.0)speed: (42245432.0, 938786.2)
#distance: 668960.8125acceleration: (-281727.2, -6260.597)speed: (40554800.0, 901216.7)
#distance: 668882.5acceleration: (-281793.2, -6262.064)speed: (-9392.008, -208.711)
