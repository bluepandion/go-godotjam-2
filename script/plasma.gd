extends CPUParticles

var splash = 0

func _ready():
	emitting = true
	set_process(true)
	assert( GameState.connect("heat_increased", self, "_heat_increased") == OK)

func _process(_delta):	
	if GameState.speed < 0.1:
		scale_amount = 16
		emission_ring_height = 16
		emission_ring_radius = 45
		lifetime = 0.5		
	else:
		lifetime = 1.5 - (splash * 0.5)
		emission_ring_radius = 37
		emission_ring_height = 1.0 + GameState.heat * 16.0
		scale_amount = 4 + GameState.heat * 3.0 + splash * 2
	splash = clamp(splash - _delta, 0, 1)
		
func _heat_increased():
	splash = 1
