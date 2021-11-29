extends Position3D

func _ready():
	set_process(true)

func _process(delta):
	transform = transform.rotated(Vector3(0,1,0), PI/2 * delta)
