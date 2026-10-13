extends Node

# Sprites
@onready var vehicle: Sprite2D = $Vehicle

# Dynamic variables
@export var vehicleSpeed: float = 150
@export var lengthSquare: float = 400
@export var targetArray: Array[Sprite2D]

# Misc
var target: Sprite2D
var notTarget: Sprite2D
var targetIndex: int

func _ready() -> void:
	targetIndex = 0
	target = targetArray[targetIndex]
	
	colorAction()

func _process(delta: float) -> void:
	targetAction()
	moveAction(delta)

func targetAction() -> void:
	if Input.is_action_just_pressed("GoTarget"):
		targetIndex = (targetIndex + 1) % targetArray.size()
		target = targetArray[targetIndex]
		
		colorAction()

func moveAction(delta: float) -> void:
	# Calculate the distance and its normelization
	var distance: Vector2 = target.global_position - vehicle.global_position
	var magnitude: Vector2 = distance.normalized()
	
	# Do the transform
	# And a condition to stop the vehicle
	if distance.length_squared() >= lengthSquare:
		vehicle.position += delta * (magnitude * vehicleSpeed)

func colorAction() -> void:
	for t in targetArray:
			t.modulate = Color.GREEN if t == target else Color.RED
