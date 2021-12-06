extends Spatial

const player_setup = preload("res://scene/player_setup.tscn")
const main_menu = preload("res://scene/main_menu.tscn")

var game
var mainmenu

func _ready():
	GameState.connect("game_started", self, "_game_started")
	GameState.connect("main_menu", self, "_main_menu")
	GameState.main_menu()

func _main_menu():
	mainmenu = main_menu.instance()
	add_child(mainmenu)

func _game_started():	
	game = player_setup.instance()
	add_child(game)
