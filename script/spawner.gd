extends Position3D

export(float, 0, 2) var dispersion = 0.1
export(NodePath) var rotator

var plasma_ball = preload("res://scene/plasma_ball.tscn")

onready var origin = $Origin
onready var targets = [
		$Origin/Target0,
		$Origin/Target1,
		$Origin/Target2,
		$Origin/Target3,
		$Origin/Target4
		]

var spread = PI/4
var interval = 1.0
var time = 1.0
var _base_transform
var _rotator

func _ready():
	_base_transform = transform
	set_process(true)
	_rotator = get_node_or_null(rotator)
	

func _process(_delta):
	time -= _delta
	if time < 0:
		time = interval / (1.0 + (GameState.speed - 1.0) * 0.75)
		spawn()

func spawn():	
	#transform = _base_transform.rotated(Vector3(0,0,1), rand_range(-dispersion, dispersion))

	#print("Spawn plasma")
	var plasma = plasma_ball.instance()
	add_child(plasma)

	var angle = floor(rand_range(-3, 3)) / 3 * spread
	plasma.global_transform = global_transform
	plasma.initialize(origin.global_transform, 1.0)
	plasma.angle = angle
			
		
	
	
