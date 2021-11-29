extends Particles

func _ready():
	emitting = true
	set_process(true)

func _process(_delta):	
	if GameState.speed < 0.1:
		process_material.scale = 14
		process_material.emission_ring_height = 16
		process_material.emission_ring_radius = 45
		lifetime = 0.5		
	else:
		lifetime = 1.85
		process_material.emission_ring_radius = 37
		process_material.emission_ring_height = 1.0 + GameState.heat * 16.0
		process_material.scale = 3 + GameState.heat * 4.0
		
