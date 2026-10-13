extends Node

# Sprites
@onready var vehicle: Sprite2D = $Vehicle
@onready var targetActive: Sprite2D = $TargetActive
@onready var targetDefault: Sprite2D = $TargetDefault

# Dynamic variables
@export var vehicleSpeed: float = 150
@export var lengthSquare: float = 400
@export var timerWall: float = 3

# Misc
var IsTargetActive: bool
var target: Sprite2D
var timer: float

func _ready() -> void:
	IsTargetActive = false
	target= targetDefault
	timer = 0

func _process(delta: float) -> void:
	targetInput(delta)
	move(delta)

func targetInput(delta: float) -> void:
	if IsTargetActive:
		timer += delta
		if timer >= timerWall:
			IsTargetActive = false
			target = targetDefault
			timer = 0

	if !IsTargetActive and Input.is_action_just_pressed("GoTarget"):
		IsTargetActive = true
		target = targetActive

func move(delta: float) -> void:
	# Calculate the distance and its normelization
	var distance: Vector2 = target.global_position - vehicle.global_position
	var magnitude: Vector2 = distance.normalized()
	
	# Do the transform
	# And a condition to stop the vehicle
	if distance.length_squared() >= lengthSquare:
		vehicle.position += delta * (magnitude * vehicleSpeed)
