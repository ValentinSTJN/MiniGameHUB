extends Node2D

@onready var ambulance: Sprite2D = $Ambulance
@onready var buggy: Sprite2D = $Buggy



func _ready() -> void:
	pass

func _process(delta: float) -> void:
	ambulance.position += _speed(30, ambulance.position.y) * (delta)
	buggy.position += Vector2(buggy.position.x, 30) * (delta)

func _speed(speed: float, target_position: float) -> Vector2:
	return Vector2(speed, target_position)
