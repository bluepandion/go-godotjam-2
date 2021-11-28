class_name Bullet
extends RigidBody

var _life: float = 0.5

func _ready():
	pass

func initialize(position: Vector3, speed: float):
	$CollisionShape.transform.origin = position
	angular_velocity.y = -3 * GameState.speed
	set_physics_process(true)

func _physics_process(delta):
	_life -= delta
	if _life <= 0:
		queue_free()
	
