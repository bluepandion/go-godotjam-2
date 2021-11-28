extends CanvasLayer

func _init():
	assert( GameState.connect("hud_updated", self, "_hud_updated") == OK )
	assert( GameState.connect("game_over", self, "_game_over") == OK )

func _hud_updated():
	$Score.text = str(GameState.score)
	$Heat.text = str(GameState.heat)

func _game_over():
	$GameOver.visible = true
