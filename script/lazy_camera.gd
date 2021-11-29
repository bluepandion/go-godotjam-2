extends PathFollow

onready var target = $"../PathFollow"

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	if target:
		unit_offset = lerp(unit_offset, target.unit_offset, delta * 50)
