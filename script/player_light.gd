extends OmniLight

var light_add_damage = 0
var light_add_score = 0

func _ready():
	assert( GameState.connect("heat_increased", self, "_heat_increased") == OK )
	assert( GameState.connect("energy_increased", self, "_energy_increased") == OK )
	
	set_process(true)

func _process(delta):
	var e = 0.5
	var c = Color(1,1,1,1).blend(Color(1,0,0,clamp(GameState.heat * 2,0,1)))
	c = c.blend(Color(3, 0, 0, light_add_damage))
	e += GameState.heat * 0.5
	e += light_add_damage
	e += light_add_score
	c = c.blend(Color(0, 1.5, 0, light_add_score) * 1.0)
	e += light_add_score
	
	light_color = c
	light_energy = e
	
	light_add_damage = max(0, light_add_damage - delta)
	light_add_score = max(0, light_add_score - delta)
	

func _heat_increased():
	light_add_damage = 0.5

func _energy_increased():
	light_add_score = 0.5
