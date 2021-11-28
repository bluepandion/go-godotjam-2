extends Position3D

onready var pathfollow: PathFollow = $Path/PathFollow
onready var player = $Path/PathFollow/PlayerPos/Player
onready var camera = $Path/PathFollow/CameraPos/Camera

var bullet = preload("res://scene/bullet.tscn")

var _speed: Vector2

func _ready():
	set_physics_process(true)
	camera.current = true

func _physics_process(delta):
	var mul = clamp(GameState.speed * 0.5, 1.0, 8.0)
	pathfollow.unit_offset = clamp(pathfollow.unit_offset + _speed.x * delta * mul, 0, 1)
	_speed.x = lerp(_speed.x, 0, delta * 40 * mul)
	if GameState.speed > 0:
		if 	Input.is_action_pressed("ui_left"):
			#_speed.x = -1
			_speed.x = lerp(_speed.x, -1, delta * 80 * mul)
		if 	Input.is_action_pressed("ui_right"):
			#_speed.x = 1
			_speed.x = lerp(_speed.x, 1, delta * 80 * mul)
		if Input.is_action_just_pressed("ui_select"):
			shoot()	
	if Input.is_action_pressed("ui_escape"):
		queue_free()
		GameState.main_menu()
		
func shoot():
	var b = bullet.instance()
	var root = get_tree().current_scene
	b.initialize(player.global_transform.origin, 1.0)
	root.add_child(b)
	
		
