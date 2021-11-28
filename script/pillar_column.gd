extends Position3D

onready var light = $OmniLight

func _ready():
	set_process(true)

func _process(_delta):
	light.light_energy = 2.0 + GameState.heat * 2.0
