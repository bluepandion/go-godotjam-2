extends Spatial

func _ready():
	set_process(true)
	$CanvasLayer/Control/HighScore.text = str(GameState.high_score)

func _process(_delta):
	if Input.is_action_pressed("ui_accept"):
		queue_free()
		GameState.start_game()
