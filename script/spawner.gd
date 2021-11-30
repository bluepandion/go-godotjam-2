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

var spread = PI/3.5
var interval = 1.0
var time = 1.5
var _base_transform
var _rotator
var prev_spawn_angle = 0
const ANGLES = 3

func _ready():
	_base_transform = transform
	set_process(true)
	_rotator = get_node_or_null(rotator)
	

func _process(_delta):
	time -= _delta * (1.0 + (GameState.speed - 1.0) * 1.0)
	if time < 0:
		time = interval 
		spawn()

func spawn():
	if GameState.speed < 1:
		return
	#transform = _base_transform.rotated(Vector3(0,0,1), rand_range(-dispersion, dispersion))

	#print("Spawn plasma")
	var plasma = plasma_ball.instance()
	add_child(plasma)

	var angle = floor(rand_range(-ANGLES, ANGLES))
	if abs(angle-prev_spawn_angle) > ANGLES:
		angle = 0
	prev_spawn_angle = angle
	
	plasma.global_transform = global_transform
	plasma.initialize(origin.global_transform, 1.0)
	plasma.angle = angle / 3 * spread
			
		
	
	
