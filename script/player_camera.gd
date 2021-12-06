extends Camera

const start_fov = 60
const target_fov = 90

var duration = 0.5
var time = duration

func _ready():
	set_process(true)
	GameState.connect("game_over", self, "_game_over")

func _process(delta):
	time -= delta
	if time < 0:
		time = 0
		set_process(false)
	fov = target_fov + lerp(0, start_fov, time / duration)
	
func _game_over():
	$SfxDie.play()
