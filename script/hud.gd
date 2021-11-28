extends CanvasLayer

func _init():
	assert( GameState.connect("hud_updated", self, "_hud_updated") == OK )

func _hud_updated():
	$Score.text = str(GameState.score)
	$Heat.text = str(GameState.heat)
