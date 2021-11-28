extends Particles

func _ready():
	emitting = true
	set_process(true)

func _process(_delta):
	process_material.emission_ring_height = 1.0 + GameState.heat * 16.0
	process_material.scale = 3 + GameState.heat * 4.0
	if GameState.speed == 0:
		process_material.scale = 14
		lifetime = 0.5
		process_material.emission_ring_radius = 45
	else:
		lifetime = 1.85
		process_material.emission_ring_radius = 37
		
