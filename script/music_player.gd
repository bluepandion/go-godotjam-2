extends Node

var arp = -80
var drum = -80
var boop = -80

func _ready():	
	set_process(true)
	assert( GameState.connect("game_over", self, "_game_over") == OK )
	assert( GameState.connect("game_started", self, "_game_started") == OK )
	assert( GameState.connect("main_menu", self, "_main_menu") == OK )

func _process(delta):
	AudioServer.set_bus_volume_db(1, 
		lerp(AudioServer.get_bus_volume_db(1), arp, delta * 2))	
	AudioServer.set_bus_volume_db(2, 
		lerp(AudioServer.get_bus_volume_db(2), drum, delta * 2))

func _main_menu():
	arp = -8
	drum = -80

func _game_started():
	arp = -9
	drum = -16

func _game_over():
		arp = -20
		drum = -80
