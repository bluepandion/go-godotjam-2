extends CanvasLayer

func _init():
	GameState.connect("hud_updated", self, "_hud_updated")
	GameState.connect("game_over", self, "_game_over")

func _hud_updated():
	$Energy.text = "  " + str( int(GameState.speed * 100) ) + " %"
	$Score.text = str( int(GameState.score) ).pad_zeros(10)
	$Heat.text = "  " + str(int(GameState.heat * 100)) + " %"

func _game_over():
	$GameOver.visible = true
