extends Node

var player_currency: int = 50
var sword_price: int = 35
var damage: int = 12
var health: int = 100

func _ready() -> void:
	print("Gold left after sword purchase: %d golds." % (player_currency - sword_price))
	print("Critical hit: %d damages!" % (damage * 3))
	print("How many hits before death: %d hits." % (health / damage))
	print("Health left after those hits: %d HP." % (health % damage))
	print("Can buy the sword: %s." % (player_currency >= sword_price))
	print("Health left after critical: %d HP." % (health - (damage * 3)))
