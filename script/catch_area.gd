class_name CatchArea
extends Area

func _init():
	connect("body_entered", self, "_body_entered")

func _body_entered(body):
	if body is PlasmaBall:
		body.queue_free()
		GameState.collect_plasma()
		$SfxCollect.play(0)
		$SfxCollect.pitch_scale = 1.0 + (GameState.speed - 1.0)
