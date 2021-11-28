class_name DamageArea
extends Area

func _init():
	connect("body_entered", self, "_body_entered")
	#connect("area_entered", self, "_area_entered")

func _area_entered(area):	
	pass


func _body_entered(body):
	if body is PlasmaBall:		
		body.queue_free()
		GameState.lose_plasma()
