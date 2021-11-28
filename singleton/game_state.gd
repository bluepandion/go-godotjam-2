extends Node

signal energy_increased
signal energy_decreased
signal heat_increased
signal heat_decreased
signal speed_changed
signal score_changed
signal hud_updated
signal game_started
signal game_over
signal main_menu

var score: int = 0
var heat: float = 0
var energy: float = 0
var speed: float = 1.0
var speed_step: float = 1.0
var high_score = 10000

const SPEED_STEPPER = 0.95
const SPEED_INCREASE = 0.075
const HEAT_INCREASE = 0.05

func main_menu():
	speed = 0.25
	heat = 0
	emit_signal("main_menu")

func start_game():
	speed = 1.0
	score = 0
	heat = 0
	energy = 0
	emit_signal("game_started")
	emit_signal("hud_updated")

func collect_plasma():
	print("Plasma Collected")
	
	speed += speed_step * SPEED_INCREASE
	speed_step *= SPEED_STEPPER
	print(speed)
	
	score += 100 * (speed * 10)
	emit_signal("speed_changed")
	emit_signal("energy_increased")
	emit_signal("score_changed")
	emit_signal("hud_updated")

func lose_plasma():
	print("Plasma lost")
	heat += 0.05
	emit_signal("heat_increased")
	emit_signal("hud_updated")
	if heat >= 1.0:
		speed = 0
		emit_signal("game_over")
		if high_score < score:
			high_score = score
