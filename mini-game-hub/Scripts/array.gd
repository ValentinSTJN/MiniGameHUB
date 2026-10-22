extends Node

var wave_size := 8
var enemy_hp := 30
var total_hp := 0

func _ready() -> void:
	var txt := ""
	for wave in range(1, wave_size + 1):
		if wave % 4 == 0:
			txt = "Enemy %d : BOSS." % wave
			total_hp += enemy_hp * 2
		else:
			txt = "Enemy %d." % wave
			total_hp += enemy_hp
		print(txt)
	print(total_hp)
	
	for row in range(2):
		var ligne := ""
		for column in range(4):
			if column % 4 == 0:
				ligne += "B"
			else:
				ligne += "E"	
		print(ligne)
