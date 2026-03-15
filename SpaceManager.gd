extends Node2D
class_name SpaceManager
var planet = preload("res://objects/planet.tscn")
var ship = preload("res://objects/rocket.tscn")
enum GameState {SIMULATION, INSTANTIATING_PLANET, INSTANTIATING_SHIP}
var currentGameState:GameState
@export var spaceArea:clickableArea

signal simulationStart

func _ready():
	spaceArea.areaClicked.connect(addObject)
	
func changeTimeScale(time):
	#currentGameState = GameState.SIMULATION
	TimeProvider.timeScale = time
	if time == 1.0:
		simulationStart.emit()		

func multiplyTimeScale():
	TimeProvider.timeScale = TimeProvider.timeScale * 2
	
func resetScene():
	changeTimeScale(0)
	get_tree().change_scene_to_file("res://space.tscn")
	
func switchGameState(newGameState):
	currentGameState = newGameState
	
func instantiatePlanet(coordinates:Vector2):
	var p = planet.instantiate()
	p.position = coordinates
	add_child(p)
	#currentGameState = GameState.SIMULATION
	
func instantiateShip(coordinates:Vector2):
	var s = ship.instantiate()
	s.position = coordinates
	s.initialize(self)
	add_child(s)
	#currentGameState = GameState.SIMULATION
	
	
#func _process(_delta: float) -> void:
	#if Input.is_action_just_pressed("Mouse click"):
		#if currentGameState == GameState.INSTANTIATING_PLANET:
			#instantiatePlanet(get_global_mouse_position())
		#if currentGameState == GameState.INSTANTIATING_SHIP:
			#instantiateShip(get_global_mouse_position())
			
func addObject() -> void:
	if currentGameState == GameState.INSTANTIATING_PLANET:
		instantiatePlanet(get_global_mouse_position())
	if currentGameState == GameState.INSTANTIATING_SHIP:
		instantiateShip(get_global_mouse_position())
		

	 
			
		
		
