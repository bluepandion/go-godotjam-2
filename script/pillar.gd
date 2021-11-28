tool
extends Position3D

export(float) var on setget set_on

func _ready():
	#print("pillar")
	set_process(true)

func _process(_delta):	
	#global_transform = global_transform.looking_at(Vector3(0,0,0), Vector3(0,1,0))
	pass

func set_on(b: bool):
	on = b
	if b:
		global_transform
