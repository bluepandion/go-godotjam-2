class_name PlasmaBall
extends RigidBody

onready var shape = $CollisionShape

var distance = 12
var drop_speed = 1.5
var speed = 1
var _origin: Vector3
var angle: float
var vector: Vector3 = Vector3(1,0,0)
var travel = 0

func _init():
	connect("body_entered", self, "_body_entered")
	#connect("area_entered", self, "_area_entered")

func _ready():		
	set_physics_process(true)	

func initialize(transform, _speed):
	shape.global_transform = transform
	_origin = shape.transform.origin
	speed = _speed
	#print(global_transform.origin)
	#print(shape.global_transform.origin)

func _physics_process(_delta):
	angular_velocity.y = .8 * GameState.speed
	travel = clamp(travel + _delta*distance*drop_speed*GameState.speed,0,distance)
	shape.transform.origin = _origin + (travel * vector.rotated(Vector3(0,0,1),angle))
	
	

func _body_entered(body):
	print(body)
	if body is Bullet:
		body.queue_free()
		queue_free()
