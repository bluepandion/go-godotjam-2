extends Spatial

export(float) var speed = 0.2

func _ready():
	set_process(true)

func _process(_delta):
	transform = transform.rotated(Vector3(0,1,0), _delta * TAU * speed * GameState.speed)
