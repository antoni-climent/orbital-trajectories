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
		_speed = _speed + acceleration*delta*TimeProvider.timeScale
	print("acceleration: ", acceleration, " speed: ", _speed, " pos: ", self.position)

func updatePosition(delta):
	print("DELTA: ", delta)
	# var currentPosition = positionMeters #CoordinateConverter.PixelsToMeters(self.position)
	positionMeters += _speed * delta * TimeProvider.timeScale
	self.position = CoordinateConverter.MetersToPixels(positionMeters)
	look_at(_speed)
	
func _process(delta: float) -> void:
	updateSpeed(delta)
	updatePosition(delta)

func _ready():
	getPlanets()
	super._ready()
