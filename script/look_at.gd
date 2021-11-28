tool
extends Position3D

export(NodePath) var target setget set_target
export(NodePath) var up setget set_up
var _target
var _up
var prev_pos: Vector3

func _ready():	
	set_target(target)
	set_up(up)

func _process(_delta):
	if prev_pos != global_transform.origin:
		prev_pos = global_transform.origin
	_lookat()

func set_target(t: String):
	target = t
	_target = get_node_or_null(t)
	if _target:
		#print(_target)
		set_process(true)
	else:
		set_process(false)

func set_up(t: String):
	up = t
	_up = get_node_or_null(t)

func _lookat():
	var up_v = Vector3(0,-1,0)
	if !_target:
		print("no target")
		set_process(false)
		return
	if _up:
		up_v = global_transform.origin.direction_to(_up.global_transform.origin)	
		
	var t = global_transform.looking_at(_target.global_transform.origin, up_v)
	global_transform = t
