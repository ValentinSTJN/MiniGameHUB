extends Node

var save:String = " ana la brave;120;80 "
var array:Array = []
var username:String
var gold:int
var HP:int

func _ready() -> void:
	save = save.strip_edges()
	array = save.split(";")
	username = array[0]
	gold = array[1].to_int()
	HP = array[2].to_int()
	gold += 30
	
	save = save.replace(";", " | ")
	print(save)
